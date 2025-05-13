part of '../censor_pattern_enum.dart';

final RegExp _fiRegExp = RegExp(
    r'\b(?:perse(?:t|n)?|siki(?:ä|ö|m|n)|sy(?:y|t|ö|m|n)|hullu|kurja|vittu|jätkä|pii|paska|saast(?:a|o))\b',
    caseSensitive: false,
    unicode: true);
