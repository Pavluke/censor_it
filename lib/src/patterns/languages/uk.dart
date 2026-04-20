part of '../language_pattern.dart';

/// {@template uk_pattern}
/// Ukrainian profanity pattern.
///  {@endtemplate}
final class UkPattern implements LanguagePattern {
  /// {@macro uk_pattern}
  const UkPattern();

  @override
  String get name => 'ukrainian';

  @override
  String get locale => 'uk';

  @override
  RegExp get regExp => RegExp(
        r'(?<![а-яіїєґ])'
        r'(?:'
        r'ху[йяєїео][а-яіїєґ]*' // хуй, хуя, хуйня, хуйовий...
        r'|п[іи]зд[а-яіїєґ]*' // пізда, пизда, піздець, піздити...
        r'|(?:[еєї]б|йоб)[а-яіїєґ]*' // їбати, єбать, ебаний, йобаний...
        r'|бляд[а-яіїєґ]*' // блядь, бляді, блядський...
        r')'
        r'(?![а-яіїєґ])',
        caseSensitive: false,
        unicode: true,
      );
}
