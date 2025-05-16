part of '../censor_pattern_enum.dart';

final RegExp _enRegExp = RegExp(
    r'(?<![a-z])' // left: not a letter (or start)
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
    caseSensitive: false);
