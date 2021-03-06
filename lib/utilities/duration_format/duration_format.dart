library duration_formatting;

/// Extends the Duration class with string formatting rules.
extension stringFormatting on Duration {
  /// Returns a clock-like, string-representation of `this`.
  ///
  /// For example,
  /// ```dart
  /// Duration foo = Duration(seconds: 90);
  /// foo.toStringAsClock(); // 01:30.0
  /// ```
  String toStringAsClock() {
    String oneDigitOf(int number) {
      String numberAsSingleDigit = '';
      if (number >= 1000 || number < 0)
        throw ArgumentError();
      else if (number < 100)
        numberAsSingleDigit = "0";
      else
        numberAsSingleDigit = "${number ~/ 100}";
      assert(numberAsSingleDigit.length == 1);
      return numberAsSingleDigit;
    }

    String twoDigitsOf(int number) {
      String numberAsTwoDigits = '';
      if (number >= 100 || number < 0)
        throw ArgumentError();
      else if (number >= 10)
        numberAsTwoDigits = "$number";
      else
        numberAsTwoDigits = "0$number";
      assert(numberAsTwoDigits.length == 2);
      return numberAsTwoDigits;
    }

    int minutes = this.inMinutes.remainder(Duration.minutesPerHour);
    int seconds = this.inSeconds.remainder(Duration.secondsPerMinute);
    int ms = this.inMilliseconds.remainder(Duration.millisecondsPerSecond);
    String mm = twoDigitsOf(minutes);
    String ss = twoDigitsOf(seconds);
    String m = oneDigitOf(ms);
    return "$mm:$ss.$m";
  }
}
