part of '../censor_pattern_enum.dart';

final RegExp _esRegExp = RegExp(
    r'\b(?:cabr(?:o|ón)|carajo|chupa(?:r|ndo)|coño|culo|folla(?:r|ndo)|gilipollas|hijo(?:de)?\s*(?:puta|perra)|maric(?:a|ón)|mierda|pendejo|put(?:a|o)|rata|verga)\b',
    caseSensitive: false);
