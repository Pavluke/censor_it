import 'censor_it_base.dart';

/// {@template censor_it_mask}
/// Creates an instance that masks profanity by repeating a character.
///
/// [text] is the text to be censored.
/// [char] is the character to use for masking. Must be a single character.
/// [pattern] is the censor pattern to use.
/// Defaults to [LanguagePattern.all].
///
/// Example:
/// ```
/// final censor = CensorIt.mask(
///   'fuck this shit',
///   char: '*',
///   pattern: LanguagePattern.english,
/// );
/// print(censor.censored); // '**** this ****'
/// ```
/// {@endtemplate}
final class CensorItMask extends CensorIt {
  /// {@macro censor_it_mask}
  CensorItMask(
    super.text, {
    super.pattern,
    String char = '*',
  }) : _char = char {
    if (char.runes.length != 1) {
      throw ArgumentError('char must be a single character');
    }
  }

  final String _char;

  @override
  String replacer(String word) => _char * word.length;

  /// Returns `true` if [original], [pattern], and [_char] of both
  /// instances are the same.
  @override
  bool operator ==(Object other) {
    if (other is CensorItMask) {
      return original == other.original &&
          pattern == other.pattern &&
          _char == other._char;
    }
    return false;
  }

  @override
  int get hashCode => original.hashCode ^ pattern.hashCode ^ _char.hashCode;

  @override
  String toString() =>
      '''CensorItMask(original: $original, censored: $censored, char: $_char, pattern: $pattern)''';
}
