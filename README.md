<p align="center">
  <img src="https://github.com/Pavluke/censor_it/blob/main/images/banner.png?raw=true" alt="CensorIt Banner" />
</p>

[![Pub](https://img.shields.io/pub/v/censor_it.svg)](https://pub.dartlang.org/packages/censor_it)

Dart library for censoring text based on predefined patterns and customizable
characters.

## 🚀 Flutter Integration:

For Flutter applications, use the package `flutter_censor_it`
[GitHub](https://github.com/pavluke/flutter_censor_it) |
[Pub.dev](https://pub.dev/packages/flutter_censor_it)

## Introduction

When it comes to censoring text in your Dart application, you might need to
handle multiple languages and customize the characters used for censoring.
`CensorIt` provides an easy-to-use solution for this problem.

## Supported languages

- 🇺🇸 English (EN)
- 🇫🇮 Finnish (FI)
- 🇫🇷 French (FR)
- 🇩🇪 German (DE)
- 🇮🇹 Italian (IT)
- 🇰🇿 Kazakh (KZ)
- 🇱🇻 Latvian (LV)
- 🇱🇹 Lithuanian (LT)
- 🇵🇹 Portuguese (PT)
- 🇵🇱 Polish (PL)
- 🇷🇺 Russian (RU)
- 🇪🇸 Spanish (ES)
- 🇸🇪 Swedish (SE)
- 🇺🇦 Ukrainian (UA)

## Getting started

Add censor_it to your `pubspec.yaml`:

```yaml
dependencies:
  censor_it: ^<latest_version>
```

Or using the command:

```bash
dart pub add censor_it
```

Import the package in your Dart file:

```dart
import 'package:censor_it/censor_it.dart';
```

You can now use the CensorIt class to censor text:

```dart
void main() {

  const String text = '''
I don't give a fuck that there are a lot of obscene words here!
I'm sure the developer of this lib is an asshole!''';

  late CensorIt censoredText;

  // Create an instance of CensorIt with the text to be censored
  censoredText = CensorIt(text, pattern: CensorPattern.english);

    // Or you can create an instance of CensorIt with the text and some censor patterns
  censoredText = CensorIt(text, pattern: CensorPattern.english);

 // Or you can use function from [String] extension
  censoredText = text.censorIt(pattern: CensorPattern.fromPatterns(
          [CensorPattern.russian, CensorPattern.english]));

  // Get the censored text
  print(censoredText.censored);

  // Check if the text contains profanity
  print(censoredText.hasProfanity); // Output: true

  // Get a list of swear words found in the text
  print(censoredText.swearWords); // Output: [fuck, asshole]
}
```

## Features

- **Customizable Censor Patterns**: Use predefined censor patterns for multiple
  languages or create your own.
- **Customizable Censor Characters**: Define your own set of characters to use
  for censoring.
- **Profanity Detection**: Check if the text contains any profanity based on the
  censor pattern.
- **Swear Words Extraction**: Extract a list of swear words found in the text.

## Changelog

Please see the
[Changelog](https://github.com/pavluke/censor_it/blob/main/CHANGELOG.md) page to
know what's recently changed.

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it,
please fill an [issue](https://github.com/pavluke/censor_it/issues).\
If you fixed a bug or implemented a feature, please send a
[pull request](https://github.com/pavluke/censor_it/pulls).
