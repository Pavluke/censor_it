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
  RegExp get regExp => RegExp(
    r'(?<![а-яё])'
    r'(?:'
    r'ху[йеёиыяю][а-яё]*'
    r'|пизд[а-яё]*' // пизда, пизду, пиздец, пиздёж ...
    r'|(?:е|ё)б[а-яё]*' // ебать, ебёт, ёбнутый, ёб* ...
    r'|бляд[а-яё]*' // блядь, бляди, блядский ...
    // сука, суке, суку,
    // сукам, суках, сукой
    r'|сук[аи](?!ч)[аеёиоуыэюя]*(?:ми?|мя|х|м|й)?'
    r'|сучк[а-яё]*' // сучка, сучки, сучьё…
    r'|сукин[а-яё]*' // сукин сын, сукина…
    r'|гандон[а-яё]*' // гандон, гандоны ...
    r')'
    r'(?![а-яё])',
    caseSensitive: false,
    unicode: true,
  );
}
