# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0 beta 15] Unreleased

This release has breaking changes in the configuration file.

- The listening string became a string array on both, the LAN & Internet configuration:
  - old: `listen: /ip4/0.0.0.0/tcp/0`
  - new: `listen: [/ip4/0.0.0.0/tcp/0, /ip6/::/tcp/0]`

The qaul upgrade process will take care of the automated forward update.
If you want to roll back to an older version, you must roll back the `config.yaml` manually.

Added

- Android: app keeps running in the Background.
  - This release requires the Android permission to always run in the background.
- Run libqaul IPv4 & IPv6 dual stack by default.
  - LAN & INTERNET mode are now listening for incoming connections on IPv4 and IPv6
- Amount of listening interfaces is freely configurable in the configuration file.
  - This feature mainly targets the qauld community nodes, which can configure 0-n interfaces per module.
- Show user online status in direct chatroom.

Fixed

- Chat menu options sometimes misleading or not present.
- Fixed several documentation mistakes.

## [2.0.0 beta 14] 2023-03-20

Added

- Italian Translation

Fixed

- Chinese & German translation
- Diverse Snap problems
- Linux GUI icon problems in nav bar

## [2.0.0 beta 13] 2023-02-05

Added

- Spanish translation
- qauld docker image with docker-compose management
- iOS testflight listing

Fixed

- Snap: ultimately fixed: rights blockings, libqaul compilation for snap store, access rights, etc.
- UI:
  - default locale on startup screen

Changed

- better translation strings for translators
- upgraded to stable flutter version 3.7

## [2.0.0 beta 12] 2022-12-13

Fixed

- Android: build android library for release, fixed a bug that was not building for release.
- Snap: Set correct storage path to where the app has permission to store.

## [2.0.0 beta 11] 2022-12-01

Added

- French translation
- German translation

Changed

- many UI changes & fixes
- upgraded libp2p to version 0.50
- build android library for release
- Window app name title fixed

## [2.0.0 beta 10] 2022-11-24

Added

- Arabic translation
- Russian translation

Changed

- Libqaul only contains parts of libp2p.
- Made public messages selectable.
- fixed a lag of the UI when running qaul for a longer time.
- Many UI updates.

## [2.0.0 beta 9] 2022-11-17

Added

- Internet Nodes now have an optional alias name.
- New upgrade module to automatically migrate versions with incompatible configuration or data base structures.
- All chat files display screen.
- New Mainland Chinese user interface translation.
- New Taiwanese Chinese user interface translation.

Changed

- Upgraded some rust libraries to newest versions.
- Many UI updates.

## [2.0.0 beta 8] 2022-11-10

Changed

- GUI: Many updates.
- Libqaul: Upgraded deprecated ping & identify functions

Fixed

- Fixed chat image loading bug.

## [2.0.0 beta 7] 2022-11-5

Changed

- Upgraded rust-libp2p to version 0.49.0
- Many GUI updates.
- Snap package on grade stable.

Fixed

- Fixed group chat rendering panic
- Fixed storage user adding widget
- Windows UI is now using the entire window.
