import 'package:censor_it/src/patterns/language_pattern.dart';

import 'base_sample.dart';

class EnSample implements BaseSample {
  @override
  LanguagePattern get pattern => LanguagePattern.english;

  @override
  List<String> get badWords => [
    'fuck',
    'fucker',
    'fucking',
    'fucked',
    'fucks',
    'motherfucker',
    'bullshit',
    'shit',
    'shitty',
    'shithead',
    'asshole',
    'dick',
    'dickhead',
    'cock',
    'bastard',
    'slut',
    'sluts',
    'whore',
    'whores',
  ];

  @override
  List<String> get safeWords => [
    'cocktail',
    'cockpit',
    'cockatoo',
    'peacock',
    'Dickinson',
    'Dickens',
    'shiitake',
    'assess',
    'bassoon',
    'bullish',
  ];
}
