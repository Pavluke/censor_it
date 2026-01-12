part of '../language_pattern.dart';

/// {@template zh_pattern}
/// Chinese profanity pattern.
///  {@endtemplate}
final class ZhPattern implements LanguagePattern {
  /// {@macro za_pattern}
  const ZhPattern();

  @override
  String get name => 'chinese';

  @override
  String get locale => 'zh';

  @override
  RegExp get regExp {
    return RegExp(
      r'(?:'
      r'操你祖宗十八代|'
      r'[操肏艹](?:你|妳|您)?祖宗|'
      r'臭婊子|'
      r'[操肏艹](?:你|妳|您)?(?:妈|媽)(?:的)?(?:[屄逼])?|'
      r'你?[妈媽][屄逼]|'
      r'去你[妈媽]的|滚你[妈媽]|'
      r'日你(?:[妈媽])?|日死你|'
      r'我操|卧槽|操你|操蛋|'
      r'鸡巴|雞巴|鷄巴|屌丝|婊子|贱货|'
      r'[傻二煞装裝牛][屄逼]|'
      r'(?<![一-龯\u3400-\u4DBF])逼(?![一-龯\u3400-\u4DBF真迫])|'
      r'(?<![一-龯\u3400-\u4DBF])操(?![一-龯\u3400-\u4DBF作场练心纵])|'
      r'(?<![一-龯\u3400-\u4DBF])干(?![一-龯\u3400-\u4DBF净燥杯活部脆扰])|'
      r'(?<![一-龯\u3400-\u4DBF])幹(?![一-龯\u3400-\u4DBF])|'
      r'(?<![一-龯\u3400-\u4DBF])日(?![一-龯\u3400-\u4DBF本期常子历光])|'
      r'(?<![一-龯\u3400-\u4DBF])屌(?![一-龯\u3400-\u4DBF])|'
      r'屄|肏|艹'
      r')',
      caseSensitive: false,
      unicode: true,
    );
  }
}
