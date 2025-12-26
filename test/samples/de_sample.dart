import 'package:censor_it/src/patterns/language_pattern.dart';

import 'base_sample.dart';

class DeSample implements BaseSample {
  @override
  LanguagePattern get pattern => LanguagePattern.german;

  @override
  List<String> get badWords => [
    'fick',
    'ficken',
    'fickst',
    'verfickt',
    'scheiße',
    'scheisse',
    'scheissdreck',
    'arschloch',
    'drecksau',
    'hurensohn',
    'fotze',
    'fotzen',
    'wichser',
  ];

  @override
  List<String> get safeWords => [
    'Fickian',
    'marschieren',
    'Marschall',
    'scheiden',
    'Scheinwerfer',
    'Fotozelle',
  ];
}
