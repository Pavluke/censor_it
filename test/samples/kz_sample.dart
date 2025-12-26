import 'package:censor_it/src/patterns/language_pattern.dart';

import 'base_sample.dart';

class KzSample implements BaseSample {
  @override
  LanguagePattern get pattern => LanguagePattern.kazakh;

  @override
  List<String> get badWords => [
    'қотақ',
    'қотақты',
    'қотақтың',
    'боқ',
    'боқты',
    'боқтың',
    'анаңды',
    'анаңның',
    'шешеңді',
    'шешеңнің',
  ];

  @override
  List<String> get safeWords => [
    'сақотақты', // …қотақ…
    'абоқтау', // …боқ…
    'баланаңда', // …анаң…
  ];
}
