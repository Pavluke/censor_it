part of '../language_pattern.dart';

/// {@template kk_pattern}
/// Kazakh profanity pattern.
///  {@endtemplate}
final class KkPattern implements LanguagePattern {
  /// {@macro kk_pattern}
  const KkPattern();

  @override
  String get name => 'kazakh';

  @override
  String get locale => 'kk';

  @override
  RegExp get regExp => RegExp(
        r'(?<![а-яёәғқңөұүһі])'
        r'(?:'
        r'қотақ[а-яёәғқңөұүһі]*' // қотақ, қотақты, қотақтың …
        r'|боқ[а-яёәғқңөұүһі]*' // боқ, боқты, боқтың …
        r'|анаң[а-яёәғқңөұүһі]*' // анаңды, анаңның …
        r'|шешең[а-яёәғқңөұүһі]*' // шешеңді, шешеңнің …
        r')'
        r'(?![а-яёәғқңөұүһі])',
        caseSensitive: false,
        unicode: true,
      );
}
