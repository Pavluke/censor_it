import 'package:censor_it/censor_it.dart';
import 'package:test/test.dart';

typedef Samples = ({List<String> dirty, List<String> safe});

class CensorItTest {
  CensorItTest({required this.samples, required this.pattern});
  final Samples samples;
  final CensorPattern pattern;

  void dirtyTest() {
    test('Detect ${pattern.name} swear words', () {
      final String textWithSwearWords = samples.dirty.toSet().join(' ');

      final CensorIt censorIt = CensorIt(textWithSwearWords, pattern: pattern);

      final List<String> detectedSwearWords = censorIt.swearWords;

      for (final String swearWord in samples.dirty) {
        expect(detectedSwearWords, contains(swearWord));
      }
    });
  }

  void safeTest() {
    test('Ignore benign ${pattern.name} look-alikes', () {
      final String benignText = samples.safe.toSet().join(' ');
      final CensorIt censorIt = CensorIt(benignText, pattern: pattern);

      expect(censorIt.swearWords, isEmpty,
          reason: 'Detected swear words where there should be none.');

      for (final word in samples.safe) {
        expect(censorIt.swearWords, isNot(contains(word)),
            reason: 'False positive detected for "$word".');
      }
    });
  }
}
