import 'package:censor_it/censor_it.dart';

void main() {
  const String text = '''
Это ебаный текст для блядской проверки!
I don't give a fuck that there are a lot of obscene words here!
I'm sure the developer of this lib is an asshole!''';

  //const String text = 'Holy shit, it works!';
  late CensorIt censoredText;
  // Create an instance of CensorIt with the text and censor pattern
  censoredText = CensorIt(text,
      pattern: CensorPattern.fromPatterns(
          [CensorPattern.russian, CensorPattern.english]));

  // Or you can use function from [String] extension
  censoredText = text.censorIt(
      pattern: CensorPattern.fromPatterns(
          [CensorPattern.russian, CensorPattern.english]));

  // Get the list of swear words
  final List<String> swearWords = censoredText.swearWords;

  // Check if the text contains profanity
  final bool hasProfanity = censoredText.hasProfanity;
// print('');
// print('${censoredText.origin} -> [ CensorIt ] -> $censoredText');
  print('Censored text: $censoredText');
  print('Has profanity: $hasProfanity');
  print('Swear words: $swearWords');
}
