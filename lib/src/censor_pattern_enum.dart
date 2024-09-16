part 'reg_exps/de.dart';
part 'reg_exps/en.dart';
part 'reg_exps/es.dart';
part 'reg_exps/fr.dart';
part 'reg_exps/it.dart';
part 'reg_exps/pl.dart';
part 'reg_exps/pt.dart';
part 'reg_exps/ru.dart';
part 'reg_exps/ua.dart';

enum CensorPattern {
  // add new language here
  deutsch,
  english,
  french,
  italian,
  portuguese,
  polish,
  russian,
  spanish,
  ukraine,
  // don't cross this line
  all,
  _another;

  static late RegExp _anotherRegExp;

  RegExp get regExp => switch (this) {
        CensorPattern.deutsch => _deRegExp,
        CensorPattern.english => _enRegExp,
        CensorPattern.french => _frRegExp,
        CensorPattern.italian => _itRegExp,
        CensorPattern.portuguese => _ptRegExp,
        CensorPattern.polish => _plRegexp,
        CensorPattern.russian => _ruRegexp,
        CensorPattern.spanish => _esRegExp,
        CensorPattern.ukraine => _uaRegExp,
        // don't cross this line
        CensorPattern.all => _combineCensorPatterns(List.generate(
            _values.length,
            (int index) => CensorPattern.values.elementAt(index))),
        CensorPattern._another => _anotherRegExp,
      };

  factory CensorPattern.fromPatterns(List<CensorPattern> patterns) {
    String combinedPattern =
        patterns.map((censorPattern) => censorPattern.regExp.pattern).join('|');
    _anotherRegExp =
        RegExp(combinedPattern, caseSensitive: false, unicode: true);
    return CensorPattern._another;
  }

  factory CensorPattern.fromRegExp(RegExp regExp) {
    _anotherRegExp = regExp;
    return CensorPattern._another;
  }

  static RegExp _combineCensorPatterns(List<CensorPattern> patterns) {
    String combinedPattern =
        patterns.map((pattern) => pattern.regExp.pattern).join('|');
    return RegExp(combinedPattern, caseSensitive: false, unicode: true);
  }

  static List<CensorPattern> get _values {
    List<CensorPattern> values = CensorPattern.values
        .where((value) =>
            value != CensorPattern.all && value != CensorPattern._another)
        .toList();
    return values;
  }
}
