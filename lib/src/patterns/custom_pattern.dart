import 'censor_pattern.dart';

/// Internal class for custom patterns created from [RegExp].
///
/// Use [CensorPattern.fromRegExp] factory instead of this class directly.
final class CustomPattern implements CensorPattern {
  /// {@template custom_pattern_constructor}
  /// Creates a custom pattern from a [RegExp].
  ///
  /// [regExp] is the regular expression to use for profanity detection.
  ///
  /// Example:
  /// ```
  /// final pattern = CensorPattern.fromRegExp(
  ///   RegExp(r'\b(fuck|shit|asshole)\b', caseSensitive: false),
  /// );
  /// final censor = CensorIt.mask('fuck this', pattern: pattern);
  /// ```
  /// {@endtemplate}
  const CustomPattern(this._regExp);

  final RegExp _regExp;

  /// {@macro censor_pattern_regexp_getter}
  @override
  RegExp get regExp => _regExp;
}
