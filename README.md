# Segment display widget

[![Pub](https://img.shields.io/pub/v/segment_display.svg?style=flat-square)](https://pub.dartlang.org/packages/segment_display)

Segment display widget for [Flutter](https://flutter.dev). 
Supports multiple types of segment displays and segment customization.

## Contents
* [Installation](#installation)
* Usage
  - [Seven-segment display](#seven-segment-display)
  - [Fourteen-segment display](#fourteen-segment-display)
* [Features and bugs](#features-and-bugs)

## Installation
1. Add to dependencies (pubspec.yaml file)
```yaml
dependencies:
  segment_display: ^0.1.0
```
2. Install
```
$ flutter packages get
```

3. Import
```dart
import 'package:segment_display/segment_display.dart';
```

## Usage

### Seven-segment display
```dart
SevenSegmentDisplay(
  text: "123",
  textSize: 12.0,
);
```

### Fourteen-segment display
```dart
FourteenSegmentDisplay(
  text: "123",
  textSize: 12.0,
);
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/janstol/flutter_segment_display/issues