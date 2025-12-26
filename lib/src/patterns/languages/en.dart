part of '../language_pattern.dart';

/// {@template en_pattern}
/// English profanity pattern.
///  {@endtemplate}
final class EnPattern implements LanguagePattern {
  /// {@macro en_pattern}
  const EnPattern();
  @override
  String get name => 'english';

  @override
  String get locale => 'en';

  @override
  RegExp get regExp => RegExp(
    r'(?<![a-z])'
    r'(?:'
    r'motherfucker' // motherfucker
    r'|fuck(?:er|ing|ed|s)?' // fuck, fucker, fucking, …
    r'|bullshit' // bullshit
    r'|shit(?:head|ty)?' // shit, shitty, shithead
    r'|asshole' // asshole
    r'|dick(?:head)?' // dick, dickhead
    r'|cock' // cock
    r'|bastard' // bastard
    r'|slut(?:s)?' // slut, sluts
    r'|whore(?:s)?' // whore, whores
    r')'
    r'(?![a-z])', // right: not a letter (or end)
    caseSensitive: false,
  );
}
