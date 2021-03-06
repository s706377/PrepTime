part of '../debate_events.dart';

/// Defines a DebateEvent in lincoln-douglas format.
class LincolnDouglas extends DebateEvent {
  /// Specific rules for lincoln douglas debate
  static const int _prepTime = 4;
  static const int _crossX = 4;

  /// High school lincoln-douglas debate.
  LincolnDouglas.highSchool()
      : super(
          name: 'HS Lincoln-Douglas',
          description: '$_prepTime\' Prep',
          speeches: [
            _createSpeech('AC', 4),
            _createSpeech('CX', _crossX),
            _createSpeech('NC', 8),
            _createSpeech('CX', _crossX),
            _createSpeech('1AR', 4),
            _createSpeech('NR', 5),
            _createSpeech('2AR', 4),
          ],
        ) {
    super.initPrepTimers(
      duration: Duration(minutes: _prepTime),
      useAffNeg: true,
    );
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) {
    return other is LincolnDouglas && this.hashCode == other.hashCode;
  }
}
