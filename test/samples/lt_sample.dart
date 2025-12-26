import 'package:censor_it/src/patterns/language_pattern.dart';

import 'base_sample.dart';

class LtSample implements BaseSample {
  @override
  LanguagePattern get pattern => LanguagePattern.lithuanian;

  @override
  List<String> get badWords => [
    'bybis',
    'bybio',
    'bybiu',
    'bybiui',
    'pizda',
    'pizdos',
    'pizdu',
    'pizdinau',
    'nahui',
    'nahuj',
    'nahuja',
    'blet',
    'bletai',
    'bletu',
  ];

  @override
  List<String> get safeWords => [
    'abybė', // …byb…
    'kapizdėti', // …pizd…
    'panahuija', // …nahui…
  ];
}
