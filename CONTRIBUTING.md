# Contributing

Contributions are welcome! Please open an issue before submitting a pull request for non-trivial changes so we can discuss the approach first.

## Getting started

```bash
git clone https://github.com/janstol/flutter_segment_display.git
cd flutter_segment_display
flutter pub get
```

## Development

```bash
flutter analyze   # static analysis (must pass with zero issues)
flutter test      # run all tests
```

The project uses strict analysis options (80-char line limit, single quotes, no implicit casts/dynamics). Run `flutter analyze` before submitting.

## Adding a new character

Add the character and its bitmask to the relevant map(s) in `lib/src/character_segment_map.dart` (`seven`, `fourteen`, and/or `sixteen`). Each bit in the bitmask corresponds to a segment — see the existing entries and the named constructors in `lib/src/segment/segment.dart` for the bit ordering.

## Adding a new segment style

Extend `SegmentStyle` (`lib/src/segment_style/segment_style.dart`), implement `createHorizontalPath`, `createVerticalPath`, `createDiagonalForwardPath`, and `createDiagonalBackwardPath`, then export the class from `lib/segment_display.dart`.

## Golden tests

The tests in `test/` are golden image tests. If your change intentionally affects rendering, regenerate the goldens:

```bash
flutter test --update-goldens
```

## Pull request checklist

- `flutter analyze` passes with zero issues
- `flutter test` passes (update goldens if rendering changed)
- CHANGELOG.md updated
