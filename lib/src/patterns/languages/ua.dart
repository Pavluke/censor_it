part of '../language_pattern.dart';

/// {@template ua_pattern}
/// Ukrainian profanity pattern.
///  {@endtemplate}
final class UaPattern implements LanguagePattern {
  /// {@macro ua_pattern}
  const UaPattern();

  @override
  String get name => 'ukrainian';

  @override
  String get locale => 'ua';

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
