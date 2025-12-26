import 'package:censor_it/src/patterns/language_pattern.dart';

import 'base_sample.dart';

class RuSample implements BaseSample {
  @override
  LanguagePattern get pattern => LanguagePattern.russian;

  @override
  List<String> get badWords => [
    'хуй',
    'хуя',
    'хую',
    'хуёгурты',
    'хуёвый',
    'пизда',
    'пизду',
    'пиздец',
    'пиздёж',
    'ебать',
    'ебёт',
    'ёбнутый',
    'блядь',
    'бляди',
    'блядский',
    'сука',
    'суки',
    'гандон',
    'гандоны',
  ];

  @override
  List<String> get safeWords => [
    'хлеб', // …еб
    'сукачёв', // …сука…
  ];
}
