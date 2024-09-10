import 'package:censore_it/censore_it.dart';

void main() {
  const String text = '''
This is a fucking text for the fucking test!
I don't give a fuck that there are a lot of obscene words here!
I'm sure the developer of this lib is an asshole!''';

  final CensoreIt censoredText = CensoreIt(text);
  final List<String> swearWords = censoredText.swearWords;
  final bool hasProfanity = censoredText.hasProfanity;

  print('Censored text: $censoredText');
  print('Has profanity: $hasProfanity');
  print('Swear words: $swearWords');

  censoredText
      .stream(Duration(seconds: 1))
      .listen((event) => print('\nStream: $event'));
}
