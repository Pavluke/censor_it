part of '../language_pattern.dart';

/// {@template es_pattern}
/// Spanish profanity pattern.
///  {@endtemplate}
final class EsPattern implements LanguagePattern {
  /// {@macro es_pattern}
  const EsPattern();
  @override
  String get name => 'spanish';

  @override
  String get locale => 'es';

  @override
  RegExp get regExp => RegExp(
    r'(?<![a-záéíóúñü])'
    r'(?:'
    r'hijo?s?\s*de\s*puta' // hijo de puta / hijos de puta
    r'|cabr(?:o|ó)n[a-záéíóúñü]*' // cabrón, cabronazos…
    r'|gilipollas' // gilipollas
    r'|put[ao][a-záéíóúñü]*' // puta, putos, putear…
    r'|ching[a-záéíóúñü]*' // chinga, chingar, chingado…
    r'|culer(?:o|os)[a-záéíóúñü]*' // culero, culeros
    r'|verg(?:a|as)[a-záéíóúñü]*' // verga, vergas
    r'|coñ(?:o|os)[a-záéíóúñü]*' // coño, coños
    r')'
    r'(?![a-záéíóúñü])',
    caseSensitive: false,
    unicode: true,
  );
}
