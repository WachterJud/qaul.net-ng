//! Data handling

use crate::{
    data::{Record, Tag, TagSet, Type},
    delta::{DeltaBuilder, DeltaType},
    Diff, Id, Library, Path, Result, Subscription,
};
use async_std::sync::Arc;

pub struct Data<'a> {
    pub(crate) inner: &'a Library,
    pub(crate) id: Option<Id>,
}

/// A data query type
#[derive(Clone, Debug)]
pub enum Query {
    /// Return a record by exact Id
    Id(Id),
    /// Get a record by it's path
    Path(Path),
    /// Make a query for the tag set
    Tag(SetQuery<TagSet>),
}

/// The result of a query to the database
#[derive(Clone, Debug)]
pub enum QueryResult {
    /// There was a single matching item
    Single(Arc<Record>),
    /// There were many matching items
    Many(Vec<Arc<Record>>),
}

/// A special type of query on a set
///
/// The query can either be run for a partial, or complete match.  The
/// complete match is synonymous with equality (`A = B`), whereas the
/// partial match does not have to be a true subset (`A ⊆ B`)
#[derive(Clone, Debug)]
pub enum SetQuery<T> {
    /// A partial match (subset)
    Partial(T),
    /// An  equality match
    Matching(T),
}

impl<'a> Data<'a> {
    pub fn drop(&'a self) -> &'a Library {
        self.inner
    }

    /// Insert a new record into the library and return it's ID
    ///
    /// You need to have a valid and active user session to do so, and
    /// the `path` must be unique.
    pub async fn insert<T, D>(&self, path: Path, tags: T, data: D) -> Result<Id>
    where
        T: Into<TagSet>,
        D: Into<Diff>,
    {
        let mut db = DeltaBuilder::new(self.id, DeltaType::Insert);

        let mut store = self.inner.store.write().await;
        store.insert(&mut db, self.id, &path, tags.into(), data.into())
    }

    pub async fn delete(&self, path: Path) -> Result<()> {
        let mut db = DeltaBuilder::new(self.id, DeltaType::Delete);

        let mut store = self.inner.store.write().await;
        store.destroy(&mut db, self.id, &path)
    }

    /// Update a record in-place
    pub async fn update<D>(&self, path: Path, diff: D) -> Result<()>
    where
        D: Into<Diff>,
    {
        let mut db = DeltaBuilder::new(self.id, DeltaType::Delete);

        let mut store = self.inner.store.write().await;
        store.update(&mut db, self.id, &path, diff.into())
    }

    /// Query the database with a specific query object
    pub async fn query(&self, q: Query) -> Result<QueryResult> {
        let store = self.inner.store.read().await;
        match q {
            Query::Path(ref path) => store
                .get_path(self.id, path)
                .map(|rec| QueryResult::Single(rec)),
            _ => unimplemented!(),
        }
    }

    pub async fn subscribe(&self, q: Query) -> Subscription {
        self.inner.subs.add_sub(q).await
    }
}
