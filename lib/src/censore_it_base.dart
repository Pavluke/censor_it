import 'dart:math' show Random;

import 'package:censore_it/src/regexp_pattern_enum.dart';

class CensoreIt {
  CensoreIt(String text,
      {RegExpPattern regExpPattern = RegExpPattern.english,
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
        _pattern = regExpPattern,
        _chars = chars;
  final String _text;
  final RegExpPattern _pattern;
  final List<String> _chars;

  String _censore() {
    final regExp = RegExp(_pattern.value, caseSensitive: false, unicode: true);
    final text = _text.replaceAllMapped(regExp, (Match match) {
      final original = match[0] ?? '';
      final random = Random();
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

  Stream<String> stream(Duration period) =>
      Stream.periodic(period, (_) => _censore());

  bool get hasProfanity {
    final regExp = RegExp(_pattern.value, unicode: true);
    return regExp.hasMatch(_text.toLowerCase());
  }

  List<String> get swearWords {
    final regExp = RegExp(_pattern.value, unicode: true);
    final matches = regExp.allMatches(_text.toLowerCase());
    return matches.map((match) => match.group(0)!).toSet().toList();
  }

  @override
  String toString() => _censore();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #toString) {
      return _censore();
    }
    return super.noSuchMethod(invocation);
  }

  @override
  bool operator ==(Object other) {
    if (other is CensoreIt) {
      return _text == other._text &&
          _pattern == other._pattern &&
          _chars == other._chars;
    }
    return false;
  }

  @override
  int get hashCode => _text.hashCode ^ _pattern.hashCode ^ _chars.hashCode;
}
