import 'package:censor_it/src/patterns/language_pattern.dart';

import 'base_sample.dart';

class EsSample implements BaseSample {
  @override
  LanguagePattern get pattern => LanguagePattern.spanish;

  @override
  List<String> get badWords => [
    'hijo de puta',
    'hijos de puta',
    'cabrón',
    'cabron',
    'cabrones',
    'gilipollas',
    'puta',
    'putas',
    'puto',
    'putos',
    'chingar',
    'chingada',
    'chingado',
    'chingate',
    'culero',
    'culeros',
    'verga',
    'vergas',
    'coño',
    'coños',
  ];

  @override
  List<String> get safeWords => [
    'computadora',
    'reputación',
    'diputado',
    'diputación',
    'disputar',
    'imputar',
    'envergadura',
    'cultural',
  ];
}
