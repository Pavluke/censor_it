part of '../language_pattern.dart';

/// {@template lt_pattern}
/// Lithuanian profanity pattern.
///  {@endtemplate}
final class LtPattern implements LanguagePattern {
  /// {@macro lt_pattern}
  const LtPattern();

  @override
  String get name => 'lithuanian';

  @override
  String get locale => 'lt';

  @override
  RegExp get regExp => RegExp(
    r'(?<![a-ząčęėįšųūž])'
    r'(?:'
    r'byb[a-ząčęėįšųūž]*' // bybis, bybio, bybiu, bybiui...
    r'|pizd[a-ząčęėįšųūž]*' // pizda, pizdos, pizdu, pizdinau...
    r'|nahu(?:i|j)[a-ząčęėįšųūž]*' // nahui, nahuj, nahuja...
    r'|blet[a-ząčęėįšųūž]*' // blet, bletai, bletu...
    r')'
    r'(?![a-ząčęėįšųūž])',
    caseSensitive: false,
    unicode: true,
  );
}
