import 'package:flutter/material.dart';
import 'package:preptime/models/debate_event.dart';
import 'package:preptime/models/event.dart';
import 'package:preptime/models/speech.dart';
import 'package:preptime/models/speech_event.dart';
import 'package:provider/provider.dart';

/// Returns a row of page indicators.
class SpeechIndicator extends StatelessWidget {
  static const EdgeInsetsGeometry _gap = EdgeInsets.symmetric(horizontal: 3.5);
  static const MainAxisAlignment _alignCenter = MainAxisAlignment.center;
  static const Duration _fadeDuration = Duration(milliseconds: 500);
  static const Size _indicatorSize = Size(8.0, 8.0);
  static const double _radiusOfBorder = 5.0;

  SpeechIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Event event = context.watch<Event>();
    if (event is SpeechEvent) return Container(width: 0.0, height: 0.0);
    DebateEvent debateEvent = (event as DebateEvent);
    List<Speech> speeches = debateEvent.speeches;
    return Row(
      mainAxisAlignment: _alignCenter,
      children: <Widget>[
        for (int i = 0; i < speeches.length; i++)
          _newIndicator(
            context: context,
            isActive: speeches[i] == event.speech && !debateEvent.isAnyRunning,
          ),
      ],
    );
  }

  /// Returns a new indicator with the associated styling.
  Widget _newIndicator({
    @required BuildContext context,
    @required bool isActive,
  }) {
    return AnimatedContainer(
      margin: _gap,
      height: _indicatorSize.height,
      width: _indicatorSize.width,
      duration: _fadeDuration,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).focusColor
            : Theme.of(context).shadowColor,
        borderRadius: BorderRadius.circular(_radiusOfBorder),
      ),
    );
  }
}
