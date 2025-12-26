import '../src.dart';

/// Extension for getting regex matches from [CensorIt].
extension GetMatchesX on CensorIt {
  /// Returns all regex matches found in the original text.
  ///
  /// The text is converted to lowercase before matching.
  ///
  /// Example:
  /// ```dart
  /// final censor = CensorIt.random(
  ///   'fuck this shit bastard',
  ///   pattern: LanguagePattern.english,
  /// );
  /// final matches = censor.matches;
  /// print(matches.length); // 3
  /// ```
  List<RegExpMatch> get matches =>
      pattern.regExp.allMatches(original.toLowerCase()).toList();
}
