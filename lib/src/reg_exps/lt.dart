part of '../censor_pattern_enum.dart';

final RegExp _ltRegExp = RegExp(
  r'(?<![a-ząčęėįšųūž])'
  r'(?:'
  r'byb[a-ząčęėįšųūž]*' // bybis, bybio, bybiu, bybiui...
  r'|pizd[a-ząčęėįšųūž]*' // pizda, pizdos, pizdu, pizdinau...
  r'|nahu(?:i|j)[a-ząčęėįšųūž]*' // nahui, nahuj, nahuja...
  r'|blet[a-ząčęėįšųūž]*' // blet, bletai, bletu...
  r')'
  r'(?![a-ząčęėįšųūž])',
  caseSensitive: false,
  unicode: true,
);
