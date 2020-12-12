import 'package:preptime/debate_events/debate_events.dart';
import 'package:preptime/provider/models/debate_event.dart';
import 'package:preptime/provider/models/speech.dart';
import 'package:test/test.dart';

void main() {
  group('DebateEvent', () {
    DebateEvent debateEvent;
    setUp(() {
      debateEvent = Policy.highSchool();
    });
    test('get speeches returns a non-null list of speeches.', () {
      expect(debateEvent.speeches, isNotNull);
      expect(debateEvent.speeches is List<Speech>, isTrue);
    });
    test('nextSpeech() increments the speech index.', () {
      expect(debateEvent.speeches.indexOf(debateEvent.speech), equals(0));
      debateEvent.nextSpeech();
      expect(debateEvent.speeches.indexOf(debateEvent.speech), equals(1));
    });
    test('nextSpeech() throws IndexError on last index.', () {
      for (int i = 0; i < debateEvent.speeches.length - 1; i++) {
        debateEvent.nextSpeech(); // skip through all but the last speech
      }
      expect(() => debateEvent.nextSpeech(), throwsRangeError);
    });
    test('prevSpeech() decrements the speech index.', () {
      debateEvent.nextSpeech(); // to avoid throwing RangeError
      expect(debateEvent.speeches.indexOf(debateEvent.speech), equals(1));
      debateEvent.prevSpeech();
      expect(debateEvent.speeches.indexOf(debateEvent.speech), equals(0));
    });
    test('prevSpeech() throws IndexError on first index.', () {
      expect(() => debateEvent.prevSpeech(), throwsRangeError);
    });
    test('dispose() clears the list of speeches.', () {
      debateEvent.dispose();
      expect(debateEvent.speeches, isEmpty);
      debateEvent = Policy.highSchool(); // set back up for teardown
    });
    test('dispose() clears the Event speech.', () {
      debateEvent.dispose();
      expect(debateEvent.speech, isNull);
      debateEvent = Policy.highSchool(); // set back up for teardown
    });
    tearDown(() {
      debateEvent.dispose();
    });
  });
}
