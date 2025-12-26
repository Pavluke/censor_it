part of '../language_pattern.dart';

/// {@template fr_pattern}
/// French profanity pattern.
///  {@endtemplate}
final class FrPattern implements LanguagePattern {
  /// {@macro fr_pattern}
  const FrPattern();

  @override
  String get name => 'french';

  @override
  String get locale => 'fr';

  @override
  RegExp get regExp => RegExp(
    r'(?<![A-Za-zÀ-ÖØ-öø-ÿ])'
    r'(?:'
    r'fils\s*de\s*pute' // fils de pute
    r'|putain[A-Za-zÀ-ÖØ-öø-ÿ]*' // putain, putains...
    r'|pute[A-Za-zÀ-ÖØ-öø-ÿ]*' // pute, putes...
    r'|niqu[eé][A-Za-zÀ-ÖØ-öø-ÿ]*' // nique, niqué, niquer...
    r'|encul[eé][A-Za-zÀ-ÖØ-öø-ÿ]*' // enculé, enculer...
    r'|connard[A-Za-zÀ-ÖØ-öø-ÿ]*' // connard, connards...
    r'|connass[A-Za-zÀ-ÖØ-öø-ÿ]*' // connasse, connasses...
    r'|salope[A-Za-zÀ-ÖØ-öø-ÿ]*' // salope, salopes...
    r'|b[âa]tard[A-Za-zÀ-ÖØ-öø-ÿ]*' // bâtard, batard...
    r')'
    r'(?![A-Za-zÀ-ÖØ-öø-ÿ])',
    unicode: true,
    caseSensitive: false,
  );
}
