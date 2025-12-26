part of '../language_pattern.dart';

/// {@template pl_pattern}
/// Polish profanity pattern.
///  {@endtemplate}
final class PlPattern implements LanguagePattern {
  /// {@macro pl_pattern}
  const PlPattern();

  @override
  String get name => 'polish';

  @override
  String get locale => 'pl';

  @override
  RegExp get regExp => RegExp(
    r'(?<![a-ząćęłńóśźż])'
    r'(?:'
    r'kurw[a-ząćęłńóśźż]*' // kurwa, kurwy, kurwie, kurwo...
    r'|skurw[a-ząćęłńóśźż]*' // skurwiel, skurwysyn, skurwiony...
    r'|chuj[a-ząćęłńóśźż]*' // chuj, chuja, chujem, chuje...
    r'|jeb[a-ząćęłńóśźż]*' // jebać, jebany, jebana, jebane...
    r'|pierdol[a-ząćęłńóśźż]*' // pierdolę, pierdolić, pierdolony...
    r'|pizd[a-ząćęłńóśźż]*' // pizda, pizdy, pizdę, pizdo...
    r')'
    r'(?![a-ząćęłńóśźż])',
    caseSensitive: false,
    unicode: true,
  );
}
