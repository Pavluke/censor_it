import 'package:censor_it/src/patterns/language_pattern.dart';

import 'base_sample.dart';

class PlSample implements BaseSample {
  @override
  LanguagePattern get pattern => LanguagePattern.polish;

  @override
  List<String> get badWords => [
    'kurwa',
    'kurwy',
    'kurwie',
    'kurwą',
    'kurwo',
    'skurwiel',
    'skurwysyn',
    'skurwiony',
    'chuj',
    'chuja',
    'chujem',
    'chuje',
    'jebać',
    'jebac',
    'jebany',
    'jebana',
    'jebane',
    'jebani',
    'pierdolę',
    'pierdolić',
    'pierdolicie',
    'pierdolony',
    'pierdoleni',
    'pizda',
    'pizdy',
    'pizdę',
    'pizdo',
    'pizdom',
  ];

  @override
  List<String> get safeWords => [
    'rekurencyjny', // …kur…
    'jabłko',
    'kapizdinek', // …pizd…
  ];
}
