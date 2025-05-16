import 'package:censor_it/censor_it.dart';
import 'package:test/test.dart';

import 'censor_it_test.dart';
import 'samples/langs.dart';

void main() {
  final tests = <CensorItTest>[
    CensorItTest(
        samples: (dirty: deDirtySamples, safe: deSafeSamples),
        pattern: CensorPattern.german),
    CensorItTest(
        samples: (dirty: enDirtySamples, safe: enSafeSamples),
        pattern: CensorPattern.english),
    CensorItTest(
        samples: (dirty: esDirtySamples, safe: esSafeSamples),
        pattern: CensorPattern.spanish),
    CensorItTest(
        samples: (dirty: fiDirtySamples, safe: fiSafeSamples),
        pattern: CensorPattern.finnish),
    CensorItTest(
        samples: (dirty: itDirtySamples, safe: itSafeSamples),
        pattern: CensorPattern.italian),
    CensorItTest(
        samples: (dirty: lvDirtySamples, safe: lvSafeSamples),
        pattern: CensorPattern.latvian),
    CensorItTest(
        samples: (dirty: frDirtySamples, safe: frSafeSamples),
        pattern: CensorPattern.french),
    CensorItTest(
        samples: (dirty: kzDirtySamples, safe: kzSafeSamples),
        pattern: CensorPattern.kazakh),
    CensorItTest(
        samples: (dirty: ltDirtySamples, safe: ltSafeSamples),
        pattern: CensorPattern.lithuanian),
    CensorItTest(
        samples: (dirty: plDirtySamples, safe: plSafeSamples),
        pattern: CensorPattern.polish),
    CensorItTest(
        samples: (dirty: ptDirtySamples, safe: ptSafeSamples),
        pattern: CensorPattern.portuguese),
    CensorItTest(
        samples: (dirty: ruDirtySamples, safe: ruSafeSamples),
        pattern: CensorPattern.russian),
    CensorItTest(
        samples: (dirty: seDirtySamples, safe: seSafeSamples),
        pattern: CensorPattern.swedish),
    CensorItTest(
        samples: (dirty: uaDirtySamples, safe: uaSafeSamples),
        pattern: CensorPattern.ukrainian),
  ];

  group('Dirty:', () {
    for (final t in tests) {
      t.dirtyTest();
    }
  });

  group('Safe:', () {
    for (final t in tests) {
      t.safeTest();
    }
  });
}
