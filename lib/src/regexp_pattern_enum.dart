part './patterns/de.dart';
part './patterns/en.dart';
part './patterns/es.dart';
part './patterns/fr.dart';
part './patterns/it.dart';
part './patterns/pt.dart';
part './patterns/ru.dart';
part './patterns/ua.dart';

enum RegExpPattern {
  english,
  russian,
  ukraine,
  deutsch,
  italian,
  portuguese,
  spanish,
  french;

  String get value => switch (this) {
        RegExpPattern.russian => _ruPattern,
        RegExpPattern.ukraine => _uaPattern,
        RegExpPattern.english => _enPattern,
        RegExpPattern.deutsch => _dePattern,
        RegExpPattern.italian => _itPattern,
        RegExpPattern.portuguese => _ptPattern,
        RegExpPattern.spanish => _esPattern,
        RegExpPattern.french => _frPattern,
      };
}
