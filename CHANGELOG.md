# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Fixed

- Fixed clipping and an extra empty character slot when `showDisabledDividers` is enabled for values containing a colon.

## [0.6.0] - 2026-04-10

### Added

- Added `.mise.toml` for Flutter version pinning (3.35.7)
- Added `showDisabledDividers` parameter — always show decimal point after each character (dim unless `.` follows in `value`), closes #6
- Added `customCharacterMap` parameter — merge custom `char → bitmask` entries on top of the built-in map, closes #1

### Changed

- Migrated to Dart 3 / Flutter 3 (SDK constraint `>=3.0.0 <4.0.0`)
- Replaced deprecated `lint` package with `flutter_lints ^5.0.0`
- Updated `intl` to `^0.19.0` in example
- Updated `analysis_options.yaml` (removed Dart 2 `strong-mode` options)
- Modernized constructors to use super parameters
- Updated golden test images for Flutter 3 renderer
- Updated GitHub Actions workflow actions to current versions

### Fixed

- Fixed `computeSize()` spacing formula consistency (#5)

## [0.5.0] - 2021-03-06

### Changed

- Migrated to nullsafety

## [0.4.2] - 2021-02-21

### Added

- Added minus and underscore to 7-segment display (thanks [@prwater](https://github.com/prwater) for [contribution](https://github.com/janstol/flutter_segment_display/pull/4))

## [0.4.1+1] - 2020-05-09

### Changed

- Minor update (fixed lints, updated example)

## [0.4.1] - 2019-12-22

### Added

- Added [web demo](https://janstol.github.io/flutter_segment_display/)

### Changed

- Updated dependencies (SDK >=2.6.0)
- Updated analysis_options.yml (linter)

## [0.4.0] - 2019-11-25

### Added

- Added support for `.` (decimal point) and `:` (colon) characters

### Changed

- **BREAKING CHANGE:** `SegmentDisplay.text` changed to `SegmentDisplay.value`
- **BREAKING CHANGE:** `SegmentDisplay.textSize` changed to `SegmentDisplay.size`

## [0.3.0] - 2019-10-11

### Added

- Wrapped segment display with `Semantics` widget
- Added widget tests

### Changed

- Updated example

## [0.2.0] - 2019-05-13

### Added

- Added **sixteen-segment** display

### Changed

- Updated segment styles for sixteen-segment display
- Updated HexSegmentStyle diagonals

## [0.1.0] - 2019-05-11

### Added

- Initial release
- Added **seven-segment** and **fourteen-segment** display
- Added DefaultSegmentStyle, HexSegmentStyle and RectSegmentStyle
