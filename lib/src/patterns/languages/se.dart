part of '../language_pattern.dart';

/// {@template sv_pattern}
/// Swedish profanity pattern.
///  {@endtemplate}
final class SvPattern implements LanguagePattern {
  /// {@macro sv_pattern}
  const SvPattern();

  @override
  String get name => 'swedish';

  @override
  String get locale => 'sv';

  @override
  RegExp get regExp => RegExp(
        r'(?<![a-zåäö])'
        r'(?:'
        r'fitt[a-zåäö]*' // fitta, fittan, fittor, fittigt ...
        r'|kuk(?:'
        r'' // ren “kuk”
        r'|en' // kuken
        r'|ar(?:na)?' // kukar, kukarna
        r'|s' // kuks
        r')'
        r'|knull[a-zåäö]*' // knull, knulla, knullade, knullat ...
        r'|hor[a-zåäö]*' // hora, horan, horor, horunge ...
        r')'
        r'(?![a-zåäö])',
        caseSensitive: false,
        unicode: true,
      );
}
