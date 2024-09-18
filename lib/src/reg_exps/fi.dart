part of '../censor_pattern_enum.dart';

final RegExp _fiRegExp = RegExp(
    r'(?:perse(?:t|n)?|siki(?:ä|ö|m|n)|sy(?:y|t|ö|m|n)|hullu|kurja|vittu|jätkä|pii|paska|saast(?:a|o))',
    caseSensitive: false,
    unicode: true);
