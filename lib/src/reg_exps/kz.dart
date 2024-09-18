part of '../censor_pattern_enum.dart';

final RegExp _kzRegExp = RegExp(
    r'\b(?:қой(?:а|аны)?|с(?:і|о)қ(?:а|аны)?|х(?:і|о)қ(?:а|аны)?|қойа|с(?:і|о)қа|х(?:і|о)қа|қойаны|с(?:і|о)қаны|х(?:і|о)қаны)\b',
    caseSensitive: false,
    unicode: true);
