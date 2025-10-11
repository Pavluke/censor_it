import 'package:censor_it/censor_it.dart';

void main() {
  const String text = '''
Это ебаный текст для блядской проверки!
I don't give a fuck that there are a lot of obscene words here!
I'm sure the developer of this lib is an asshole!''';

  late CensorIt censoredText;

  // Create an instance of CensorIt with the text to be censored
  censoredText = CensorIt(text, pattern: CensorPattern.english);

  // Or you can create an instance of CensorIt with the text and some censor patterns
  censoredText = CensorIt(text, pattern: CensorPattern.english);

  // Or you can use function from [String] extension
  censoredText = text.censorIt(pattern: CensorPattern.fromPatterns([CensorPattern.russian, CensorPattern.english]));

  // Get the censored text
  print(censoredText.censored);

  // Check if the text contains profanity
  print(censoredText.hasProfanity);

  // Get a list of swear words found in the text
  print(censoredText.swearWords);
}
