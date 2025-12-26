import 'package:censor_it/src/patterns/language_pattern.dart';

import 'base_sample.dart';

class UaSample implements BaseSample {
  @override
  LanguagePattern get pattern => LanguagePattern.ukrainian;

  @override
  List<String> get badWords => [
    'хуй',
    'хуя',
    'хуйня',
    'хуйовий',
    'пізда',
    'пизда',
    'піздець',
    'піздити',
    'їбати',
    'єбать',
    'ебаний',
    'йобаний',
    'блядь',
    'бляді',
    'блядський',
  ];

  @override
  List<String> get safeWords => [
    'хутір', // «ху» + «т…»
    'зебра', // …еб…
  ];
}
