/// A library for managing and combining regular expressions for censoring text in multiple languages.
///
/// This library provides an enum `CensorPattern` that represents different languages and allows
/// combining multiple regular expressions for censoring purposes.
library censor_patterns;

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

/// Enum representing different censor patterns for various languages.
enum CensorPattern {
  /// German censor pattern.
  deutsch,

  /// English censor pattern.
  english,

  /// Finnish censor pattern.
  finnish,

  /// French censor pattern.
  french,

  /// Italian censor pattern.
  italian,

  /// Kazakh censor pattern.
  kazakhstan,

  /// Latvian censor pattern.
  latvian,

  /// Lithuanian censor pattern.
  lithuanian,

  /// Portuguese censor pattern.
  portuguese,

  /// Polish censor pattern.
  polish,

  /// Russian censor pattern.
  russian,

  /// Spanish censor pattern.
  spanish,

  /// Swedish censor pattern.
  swedish,

  /// Ukrainian censor pattern.
  ukraine,

  /// Combines all censor patterns.
  all,

  /// Custom censor pattern.
  _custom;

  /// Late-initialized regular expression for custom censor pattern.
  static late RegExp _customRegExp;

  /// Returns the regular expression associated with the censor pattern.
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
        CensorPattern.latvian => _lvRegExp,
        CensorPattern.lithuanian => _ltRegExp,
        CensorPattern.swedish => _swRegExp,
        CensorPattern.all => _combineCensorPatterns(_values),
        CensorPattern._custom => _customRegExp,
      };

  /// Creates a custom censor pattern from a list of existing patterns.
  ///
  /// [patterns] is a list of [CensorPattern] to combine.
  static fromPatterns(List<CensorPattern> patterns) {
    _customRegExp = _combineCensorPatterns(patterns);
    return CensorPattern._custom;
  }

  /// Creates a custom censor pattern from a given regular expression.
  ///
  /// [regExp] is the regular expression to use for the custom pattern.
  static fromRegExp(RegExp regExp) {
    _customRegExp = regExp;
    return CensorPattern._custom;
  }

  /// Combines multiple censor patterns into a single regular expression.
  ///
  /// [patterns] is a list of [CensorPattern] to combine.
  static RegExp _combineCensorPatterns(List<CensorPattern> patterns) {
    final combinedPattern =
        patterns.map((pattern) => pattern.regExp.pattern).join('|');
    return RegExp(combinedPattern, caseSensitive: false, unicode: true);
  }

  /// Returns a list of all censor patterns except for [all] and [_custom].
  static List<CensorPattern> get _values => CensorPattern.values
      .where((value) =>
          value != CensorPattern.all && value != CensorPattern._custom)
      .toList();
}
