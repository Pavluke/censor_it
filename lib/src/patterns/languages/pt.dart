part of '../language_pattern.dart';

/// {@template pt_pattern}
/// Portuguese profanity pattern.
///  {@endtemplate}
final class PtPattern implements LanguagePattern {
  /// {@macro pt_pattern}
  const PtPattern();

  @override
  String get name => 'portuguese';

  @override
  String get locale => 'pt';

  @override
  RegExp get regExp => RegExp(
        r'(?<![a-záàâãçéêíóôõúü])'
        r'(?:'
        r'filhos?\s*da\s*puta' // filho da puta / filhos da puta
        r'|caralh[a-záàâãçéêíóôõúü]*' // caralho, caralhada...
        r'|fod[a-záàâãçéêíóôõúü-]*' // foda, foder, fodido, foda-se...
        r'|porr[a-záàâãçéêíóôõúü]*' // porra, porrão, porrada (вулг.) ...
        r'|puta[a-záàâãçéêíóôõúü]*' // puta, putaria...
        r'|merd[a-záàâãçéêíóôõúü]*' // merda, merdas...
        r'|cu(?:z[aã]o|zon[aã])?[a-záàâãçéêíóôõúü]*' // cu, cuzão, cuzona...
        r')'
        r'(?![a-záàâãçéêíóôõúü])',
        caseSensitive: false,
        unicode: true,
      );
}
