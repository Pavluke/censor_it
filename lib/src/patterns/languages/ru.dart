part of '../language_pattern.dart';

/// {@template ru_pattern}
/// Russian profanity pattern.
///  {@endtemplate}
final class RuPattern implements LanguagePattern {
  /// {@macro ru_pattern}
  const RuPattern();
  @override
  String get name => 'russian';

  @override
  String get locale => 'ru';

  @override
  RegExp get regExp {
    const prefixes = r'(?:о[бт]?|за|на|от|под|пере|про|раз|вз|из|с|у|до|вы)';

    return RegExp(
      r'(?<![а-яё])'
      r'(?:'
      // хуй и производные
      '$prefixes'
      r'ъ?ху[йеёиыяю][а-яёъь]*'
      r'|ху[йеёиыяю][а-яёъь]*'
      // пизда и производные
      r'|'
      '$prefixes'
      r'ъ?пизд[а-яёъь]*'
      r'|пизд[а-яёъь]*'
      // ебать и производные
      r'|'
      '$prefixes'
      r'ъ?[её]б[а-яёъь]*'
      r'|[её]б[а-яёъь]*'
      // блядь и производные
      r'|'
      '$prefixes'
      r'ъ?бляд[а-яёъь]*'
      r'|бляд[а-яёъь]*'
      // гандон
      r'|гандон[а-яёъь]*'
      r')'
      r'(?![а-яё])',
      caseSensitive: false,
      unicode: true,
    );
  }
}
