part of '../censor_pattern_enum.dart';

final RegExp _kzRegExp = RegExp(
  r'(?<![а-яёәғқңөұүһі])' // слева не казахская/русская буква (или начало)
  r'(?:'
  r'қотақ[а-яёәғқңөұүһі]*' // қотақ, қотақты, қотақтың …
  r'|боқ[а-яёәғқңөұүһі]*' // боқ, боқты, боқтың …
  r'|анаң[а-яёәғқңөұүһі]*' // анаңды, анаңның …
  r'|шешең[а-яёәғқңөұүһі]*' // шешеңді, шешеңнің …
  r')'
  r'(?![а-яёәғқңөұүһі])', // справа не буква (или конец)
  caseSensitive: false,
  unicode: true,
);
