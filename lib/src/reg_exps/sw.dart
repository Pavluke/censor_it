part of '../censor_pattern_enum.dart';

final RegExp _swRegExp = RegExp(
    r'(?:fitta|kuk|jävla|skit|fan|helvete|bög|satan|jävel|fuck(?:ing)?|shit(?:head)?|ass(?:hole)?|bitch(?:es)?|cunt(?:s)?|dick(?:head)?|motherfucker|pussy|slut(?:s)?|whore(?:s)?)',
    caseSensitive: false,
    unicode: true);
