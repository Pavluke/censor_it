import 'package:censor_it/censor_it.dart';

void main() {
  const String text = '''
Это ебаный текст для блядской проверки!
I don't give a fuck that there are a lot of obscene words here!
I'm sure the developer of this lib is an asshole!''';

  final CensorIt censoredText = CensorIt(text,
      pattern: CensorPattern.fromPatterns(
          [CensorPattern.russian, CensorPattern.english]));
  final List<String> swearWords = censoredText.swearWords;
  final bool hasProfanity = censoredText.hasProfanity;

  print('Censored text: $censoredText');
  print('Has profanity: $hasProfanity');
  print('Swear words: $swearWords');

  censoredText.stream(Duration(seconds: 1)).take(10).listen((String event) {
    print('''

Stream:
$event''');
  }).onDone(() => print('\nDone!'));
}
