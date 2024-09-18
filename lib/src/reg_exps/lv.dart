part of '../censor_pattern_enum.dart';

final RegExp _lvRegexp = RegExp(
    r'\b(?:suk(?:s|t)?|jeb(?:u|as)?|piz(?:da|das)?|chiu(?:s|m)?|kuk(?:as|s)|merga|vij(?:a|as))\b',
    caseSensitive: false,
    unicode: true);
