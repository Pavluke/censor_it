part 'reg_exps/de.dart';
part 'reg_exps/en.dart';
part 'reg_exps/es.dart';
part 'reg_exps/fi.dart';
part 'reg_exps/fr.dart';
part 'reg_exps/it.dart';
part 'reg_exps/kz.dart';
part 'reg_exps/lt.dart';
part 'reg_exps/lv.dart';
part 'reg_exps/pl.dart';
part 'reg_exps/pt.dart';
part 'reg_exps/ru.dart';
part 'reg_exps/sw.dart';
part 'reg_exps/ua.dart';

enum CensorPattern {
  // add new language here
  deutsch,
  english,
  finnish,
  french,
  italian,
  kazakhstan,
  latvian,
  lithuanian,
  portuguese,
  polish,
  russian,
  spanish,
  swedish,
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
        CensorPattern.polish => _plRegExp,
        CensorPattern.russian => _ruRegExp,
        CensorPattern.spanish => _esRegExp,
        CensorPattern.ukraine => _uaRegExp,
        CensorPattern.finnish => _fiRegExp,
        CensorPattern.kazakhstan => _kzRegExp,
        CensorPattern.latvian => _lvRegexp,
        CensorPattern.lithuanian => _ltRegexp,
        CensorPattern.swedish => _swRegexp,
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

  static List<CensorPattern> get _values => CensorPattern.values
      .where((value) =>
          value != CensorPattern.all && value != CensorPattern._another)
      .toList();
}
