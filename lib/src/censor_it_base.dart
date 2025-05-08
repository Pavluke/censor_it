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
      {CensorPattern pattern = CensorPattern.all,
      List<String> chars = const [
        '!',
        '#',
        '%',
        '&',
        '?',
        '@',
        '\$',
      ]})
      : _text = text,
        _pattern = pattern.regExp,
        _chars = chars;

  final String _text;
  final RegExp _pattern;
  final List<String> _chars;

  /// Returns the origin text.
  String get origin => _text;

  /// Returns the censored text.
  String get _censoredText {
    final regExp = _pattern;
    final random = Random();
    final text = _text.replaceAllMapped(regExp, (Match match) {
      final original = match[0] ?? '';
      final usedChars = <String>{};
      String lastChar = '';
      final replacement = List.generate(original.length, (index) {
        String char;
        do {
          char = _chars.elementAt(random.nextInt(_chars.length));
        } while (char == lastChar ||
            (index == 0 && char == '!') ||
            (index == original.length - 1 && char == '?'));
        lastChar = char;
        usedChars.add(char);
        return char;
      });
      if (usedChars.length < _chars.length && original.length > _chars.length) {
        final unusedChars = _chars.toSet().difference(usedChars).toList();
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
    return text;
  }

  /// Returns a stream of censored text updated at the specified period.
  /// [period] is the duration between updates. Defaults `Duration(seconds: 1)` if not specified.
  Stream<String> stream({Duration? period}) =>
      Stream.periodic(period ?? Duration(seconds: 1), (_) => _censoredText);

  /// Checks if the text contains any profanity based on the censor pattern.
  bool get hasProfanity => _pattern.hasMatch(_text.toLowerCase());

  /// Returns a list of swear words found in the text.
  List<String> get swearWords {
    final Iterable<RegExpMatch> matches =
        _pattern.allMatches(_text.toLowerCase());
    return matches.map((match) => match.group(0) ?? '').toSet().toList();
  }

  @override
  String toString() => _censoredText;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #toString) {
      return _censoredText;
    }
    return super.noSuchMethod(invocation);
  }

  @override
  bool operator ==(Object other) {
    if (other is CensorIt) {
      return _text == other._text &&
          _pattern == other._pattern &&
          _chars == other._chars;
    }
    return false;
  }

  @override
  int get hashCode => _text.hashCode ^ _pattern.hashCode ^ _chars.hashCode;
}
