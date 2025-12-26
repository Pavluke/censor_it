import 'censor_pattern.dart';

/// Internal class for multiple language patterns.
///
/// This class is used internally by [LanguagePattern.fromLocales].
/// Use [CensorPattern.multi] or [LanguagePattern.all] instead.
final class MultiCensorPattern implements CensorPattern {
  /// {@template multi_censor_pattern_constructor}
  /// Creates a multi-language pattern from a list of patterns.
  ///
  /// [patterns] must not be empty.
  ///
  /// Throws [AssertionError] if [patterns] is empty.
  ///
  /// Example:
  /// ```
  /// // Don't use directly, use factory instead:
  /// final pattern = CensorPattern.multi([
  ///   LanguagePattern.english,
  ///   LanguagePattern.spanish,
  /// ]);
  /// final censor = CensorIt.random('fuck puta', pattern: pattern);
  /// ```
  /// {@endtemplate}
  const MultiCensorPattern(this.patterns);

  /// The list of combined patterns.
  final List<CensorPattern> patterns;

  /// {@macro censor_pattern_regexp_getter}
  ///
  /// The resulting regex uses non-capturing groups and combines
  /// all pattern sources with OR operator (|).
  /// The regex is case-insensitive and Unicode-aware.
  @override
  RegExp get regExp {
    final sources = patterns.map((p) => p.regExp.pattern).toList();
    final combined = '(?:${sources.join('|')})';
    return RegExp(
      combined,
      caseSensitive: false,
      unicode: true,
    );
  }
}
