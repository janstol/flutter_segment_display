## [0.6.0] - 2026-04-10
* migrated to Dart 3 / Flutter 3 (SDK constraint `>=3.0.0 <4.0.0`)
* replaced deprecated `lint` package with `flutter_lints ^5.0.0`
* updated `intl` to `^0.19.0` in example
* updated `analysis_options.yaml` (removed Dart 2 `strong-mode` options)
* modernized constructors to use super parameters
* updated golden test images for Flutter 3 renderer
* added `.mise.toml` for Flutter version pinning (3.35.7)
* added `showDisabledDividers` parameter — always show decimal point after each
  character (dim unless `.` follows in `value`), closes #6
* added `customCharacterMap` parameter — merge custom `char → bitmask` entries
  on top of the built-in map, closes #1
* fixed `computeSize()` spacing formula consistency (#5)
* updated GitHub Actions workflow actions to current versions

## [0.5.0] - 2021-03-06
* migrated to nullsafety

## [0.4.2] - 2021-02-21
* added minus and underscore to 7-segment display (thanks [@prwater](https://github.com/prwater) for [contribution](https://github.com/janstol/flutter_segment_display/pull/4))

## [0.4.1+1] - 2020-05-09
* minor update (fixed lints, updated example)

## [0.4.1] - 2019-12-22
* updated dependencies (SDK >=2.6.0)
* updated analysis_options.yml (linter)
* added [web demo](https://janstol.github.io/flutter_segment_display/)

## [0.4.0] - 2019-11-25
* added support for `.` (decimal point) and `:` (colon) characters
* **BREAKING CHANGE:** `SegmentDisplay.text` changed to `SegmentDisplay.value`
* **BREAKING CHANGE:** `SegmentDisplay.textSize` changed to `SegmentDisplay.size`

## [0.3.0] - 2019-10-11
* wrapped segment display with `Semantics` widget
* updated example
* added widget tests

## [0.2.0] - 2019-05-13
* added **sixteen-segment** display
* updated segment styles for sixteen-segment display
* updated HexSegmentStyle diagonals

## [0.1.0] - 2019-05-11
* initial release
* added **seven-segment** and **fourteen-segment** display
* added DefaultSegmentStyle, HexSegmentStyle and RectSegmentStyle
