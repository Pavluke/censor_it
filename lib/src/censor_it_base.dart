import 'dart:math' show Random;

import 'package:censor_it/src/censor_pattern_enum.dart';

part 'censor_it_extension.dart';

/// A class for censoring text based on predefined patterns and customizable characters.
class CensorIt {
  /// Creates an instance of [CensorIt] with the given text, censor pattern, and characters.
  ///
  /// [text] is the text to be censored.
  /// [pattern] is the censor pattern to use. Defaults to [CensorPattern.all].
  /// [chars] is the list of characters to use for censoring. Defaults to a predefined set of characters.
  CensorIt(String text,
      {this.pattern = CensorPattern.all,
      this.chars = const [
        '!',
        '#',
        '%',
        '&',
        '?',
        '@',
        '\$',
      ]})
      : origin = text;

  /// The origin text.
  final String origin;

  /// The censor pattern.
  final CensorPattern pattern;

  /// The list of characters to use for censoring.
  final List<String> chars;

  String? _censored;

  /// The censored text.
  String get censored => _censored ?? (_censored = _generateCensoredText());

  /// Return a censored text.
  String _generateCensoredText() {
    final regExp = pattern.regExp;
    final random = Random();
    final censoredText = origin.replaceAllMapped(regExp, (Match match) {
      final original = match[0] ?? '';
      final usedChars = <String>{};
      String lastChar = '';
      final replacement = List.generate(original.length, (index) {
        String char;
        do {
          char = chars.elementAt(random.nextInt(chars.length));
        } while (char == lastChar ||
            (index == 0 && char == '!') ||
            (index == original.length - 1 && char == '?'));
        lastChar = char;
        usedChars.add(char);
        return char;
      });
      if (usedChars.length < chars.length && original.length > chars.length) {
        final unusedChars = chars.toSet().difference(usedChars).toList();
        final unusedChar = unusedChars[random.nextInt(unusedChars.length)];
        int unusedCharIndex;
        do {
          unusedCharIndex = random.nextInt(replacement.length);
        } while (replacement[unusedCharIndex] == lastChar);
        replacement[unusedCharIndex] = unusedChar;
      }
      return original.replaceAllMapped(RegExp('.'), (Match charMatch) {
        final char = charMatch[0] ?? '';
        return char.toUpperCase() == char
            ? replacement[charMatch.start].toUpperCase()
            : replacement[charMatch.start].toLowerCase();
      });
    });
    return censoredText;
  }

  /// Returns a stream of censored text updated at the specified period.
  /// [period] is the duration between updates. Defaults `Duration(seconds: 1)` if not specified.
  @Deprecated(
      '''This method will be removed in version 1.5. Use [Stream.periodic] instead.
Example:
```dart
  final censoredText = CensorIt(text,
      pattern: CensorPattern.fromPatterns(
          [CensorPattern.russian, CensorPattern.english]));
  final stream =  Stream.periodic(Duration(seconds: 1), (_) => censoredText.toString())
''')
  Stream<String> stream([Duration? period]) => Stream.periodic(
      period ?? Duration(seconds: 1), (_) => _generateCensoredText());

  /// Checks if the text contains any profanity based on the censor pattern.
  bool get hasProfanity => pattern.regExp.hasMatch(origin.toLowerCase());

  /// Returns a list of swear words found in the text.
  List<String> get swearWords {
    final Iterable<RegExpMatch> matches =
        pattern.regExp.allMatches(origin.toLowerCase());
    return matches.map((match) => match.group(0) ?? '').toList();
  }

  /// Regenerate censored text.
  void regenerateCensoredText() => _censored = _generateCensoredText();

  /// Return censored text.
  @override
  String toString() => censored;

  /// Return censored text.
  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #toString) {
      return censored;
    }
    return super.noSuchMethod(invocation);
  }

  /// Return `true` if [origin], [pattern], [chars] of both instances are the same.
  @override
  bool operator ==(Object other) {
    if (other is CensorIt) {
      return origin == other.origin &&
          pattern == other.pattern &&
          chars == other.chars;
    }
    return false;
  }

  @override
  int get hashCode => origin.hashCode ^ pattern.hashCode ^ chars.hashCode;
}
