import 'package:censor_it/censor_it.dart';

void main() {
  const String text = '''
Это ебаный текст для блядской проверки!
I don't give a fuck that there are a lot of obscene words here!
I'm sure the developer of this lib is an asshole!''';

  print('1. Basic English censoring with masking:');
  final basicCensor = CensorIt.mask(text, pattern: LanguagePattern.english);
  print(basicCensor.censored);
  print('Has profanity: ${basicCensor.hasProfanity}');
  print('Swear words: ${basicCensor.swearWords}\n');

  print('2. All languages pattern:');
  final allLanguages = CensorIt.mask(text, pattern: LanguagePattern.all);
  print(allLanguages.censored);
  print('Total swear words: ${allLanguages.swearWords.length}\n');

  print('3. Random character replacement:');
  final customChars = CensorIt.random(
    'This is fucking shit!',
    pattern: LanguagePattern.english,
    chars: ['*', '#', '@'],
  );
  print(customChars.censored);
  print('');

  print('4. Simple masking with single character:');
  final simpleMask = CensorIt.mask('fuck', pattern: LanguagePattern.english);
  print(simpleMask.censored);
  print('');

  print('5. Fixed string replacement:');
  final fixedReplace = CensorIt.replace(
    'fuck this shit',
    replacement: '[censored]',
    pattern: LanguagePattern.english,
  );
  print(fixedReplace.censored);
  print('');

  print('6. Custom builder function:');
  final customBuilder = CensorIt.builder(
    'fucking shit bastard',
    builder: (word) => word.length <= 4 ? '💩' : '🤬',
    pattern: LanguagePattern.english,
  );
  print(customBuilder.censored);
  print('');

  print('7. Using .censored() extension:');
  print('fuck this shit'.censored(pattern: LanguagePattern.english));
  print('');

  print('8. Regenerating random censored text:');
  final original = CensorIt.random('shit', pattern: LanguagePattern.english);
  print('First:  ${original.censored}');
  final regenerated = original.regenerate();
  print('Second: ${regenerated.censored}');
  final thirdGen = regenerated.regenerate();
  print('Third:  ${thirdGen.censored}\n');

  print('9. Custom RegExp pattern:');
  final customPattern = CensorIt.mask(
    'badword and anotherbad in text',
    pattern: CensorPattern.fromRegExp(RegExp(r'badword|anotherbad')),
  );
  print(customPattern.censored);
  print('Custom words found: ${customPattern.swearWords}\n');

  print('10. Multi-language censoring:');
  final multiLang = CensorIt.random(
    'fuck you puta blyat',
    pattern: LanguagePattern.fromLocales(['en', 'es', 'ru']),
  );
  print(multiLang.censored);
  print('Languages detected: ${multiLang.swearWords}\n');

  print('11. Using GetMatchesX extension:');
  final matchesExample = CensorIt.random(
    'fuck this shit bastard',
    pattern: LanguagePattern.english,
  );
  print('Total matches: ${matchesExample.matches.length}');
  for (final match in matchesExample.matches) {
    print('  - Found "${match.group(0)}" at index ${match.start}');
  }
}
