part of '../language_pattern.dart';

/// {@template ko_pattern}
/// Korean profanity pattern.
/// {@endtemplate}
final class KoPattern implements LanguagePattern {
  /// {@macro ko_pattern}
  const KoPattern();

  @override
  String get name => 'korean';

  @override
  String get locale => 'ko';

  @override
  RegExp get regExp {
    return RegExp(
      r'(?:'
      // 씨발/시발 (ssibal/shibal) - fuck
      r'[씨시쓔쉬쒸슈][발벌팔펄빨뻘]|'
      r'ㅅㅣㅂㅏㄹ|'
      // 개새끼 (gaesaekki) - son of a bitch
      r'개[새쌔섀쉐][끼꺼기]|'
      r'개[새쌔]?[키퀴]|'
      // СНАЧАЛА составные с 좆/좇/좉 (2+ символа)
      r'[좆좇졷좄좃좉졽](?:까|가|됐어|됐다|돼|되)|'
      r'[존좉][나니]|' // jonna - fucking (ПЕРЕД одиночным 좉)
      // ПОТОМ одиночные
      r'[좆좇졷좄좃좉졽]|'
      // 보지 (boji) - cunt
      r'(?<![가-힣])보[지찌](?![가-힣])|'
      r'[봊봋봇봈볻봁봍][빨이]|'
      // 병신 (byeongsin) - retard
      r'[병븅][신쉰]|'
      // 지랄 (jiral) - bullshit
      r'지[랄럴뢀]|'
      // 창녀/창놈 (whore/bastard)
      r'창[녀놈]|'
      // 씹 (ssip) - fuck/cunt variants
      r'[씹쒸][팔빨창할]|'
      r'씹세|씹새|'
      // 미친 (michin) - crazy + производные
      r'미친[놈년새]|'
      // 엿먹어 (eat shit)
      r'엿\s*먹어|'
      // 니애미/니에미 (your mom)
      r'니[애에]미|'
      // 걸레년 (slut)
      r'걸레\s*년|'
      // 화냥년 (bitch/slut)
      r'화냥\s*년|'
      // 꼬추 (dick)
      r'꼬추|'
      // 후장 (asshole)
      r'[후훚훐][장앙]|'
      // 색끼 (variants of 새끼)
      r'[색섹][끼키]|'
      // 조센징 (derogatory)
      r'조[선센][징]|조센'
      r')',
      caseSensitive: false,
      unicode: true,
    );
  }
}
