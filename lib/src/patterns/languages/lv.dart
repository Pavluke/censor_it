part of '../language_pattern.dart';

/// {@template lv_pattern}
/// Latvian profanity pattern.
///  {@endtemplate}
final class LvPattern implements LanguagePattern {
  /// {@macro lv_pattern}
  const LvPattern();

  @override
  String get name => 'latvian';

  @override
  String get locale => 'lv';

  @override
  RegExp get regExp => RegExp(
    r'(?<![a-zāčēģīķļņšūž])'
    r'(?:'
    r'pis[a-zāčēģīķļņšūž]*' // pist, pisies, pisu, pisās ...
    r'|pizd[a-zāčēģīķļņšūž]*' // pizda, pizdets, pizdām ...
    r'|dir[sš][a-zāčēģīķļņšūž]*' // dirsa, dirsā, dirš, diršot ...
    r'|pimp[a-zāčēģīķļņšūž]*' // pimpis, pimpja, pimpi ...
    r'|mauk(?:'
    r'a(?:s|m)?' // mauka, maukas, maukam
    r'|ai' // maukai
    r'|ām' // maukām
    r'|u|us' // mauku, maukus
    r'|i|iem' // mauki, maukiem
    r'|īt(?:e|es)?' // maukīte, maukītes
    r'))'
    r'(?![a-zāčēģīķļņšūž])',
    caseSensitive: false,
    unicode: true,
  );
}
