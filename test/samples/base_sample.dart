import 'package:censor_it/censor_it.dart';

abstract interface class BaseSample {
  LanguagePattern get pattern;
  List<String> get badWords;
  List<String> get safeWords;
}
