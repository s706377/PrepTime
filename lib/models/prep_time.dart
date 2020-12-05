import 'package:preptime/models/countdown_timer.dart';
import 'package:preptime/models/event.dart';
import 'package:preptime/models/team.dart';

/// Manages the prep time for two teams in a forensic event.
///
/// The [PrepTimeMixin] manages the state of two [CountDownTimers], one for
/// each team. The mixin exposes the [Timeable] behavior of each timer such
/// as the [start()], [stop()], [reset()], [isRunning], and [isNotRunning]
/// methods. In this case, you simply pass the team who's prep you would like
/// to start as a parameter to the exposed [Timeable] methods and the mixin
/// will do the rest.
///
/// To listen to the stream of remaining prep time duration, simply pass the
/// team you would like to listen into the [remainingPrep] method.
mixin PrepTimeMixin on Event {
  /// Maps a countdown timer to each team.
  ///
  /// Each value in team is assigned its own [CountDownTimer] to track that
  /// team's use of prep time (in this case, there are only two teams). The
  /// [CountDownTimer] implements the [Timeable] interface, so you can call
  /// start(), stop(), reset(), and isRunning on each team's prep timer.
  Map<Team, CountDownTimer> _timers;

  /// Initializes the prep timers.
  ///
  /// The prep timers will each be constructed with the given duration. This
  /// method should only be called once and there should be no timers setup yet.
  void initPrepTimers(Duration duration) {
    assert(_timers.isEmpty);
    for (Team team in Team.values) {
      _timers.putIfAbsent(team, () => CountDownTimer(duration));
    }
  }

  /// Disposes the resources held by the PrepTimeMixin.
  void disposePrepTimers() {
    _timers.forEach((_, timer) {
      timer.dispose();
    });
  }

  /// Starts the prep timer for the given team.
  void startPrep(Team team) {
    _timers[team].resume();
  }

  /// Stops the prep time for the given team.
  void stopPrep(Team team) {
    _timers[team].stop();
  }

  /// Resets the prep time for the given team.
  void resetPrep(Team team) {
    _timers[team].reset();
  }

  /// Returns the currentTime stream of the given team's prep timer.
  Stream<Duration> remainingPrep(Team team) {
    return _timers[team].currentTime;
  }
}