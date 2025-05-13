part of '../censor_pattern_enum.dart';

final RegExp _kzRegExp = RegExp(
    r'\b(?:қой(?:а|аны)?|с(?:[іi]|о)қ(?:а|аны)?|х(?:[іi]|о)қ(?:а|аны)?|қойа|с(?:[іi]|о)қа|х(?:[іi]|о)қа|қойаны|с(?:[іi]|о)қаны|х(?:[іi]|о)қаны)\b',
    caseSensitive: false,
    unicode: true);
