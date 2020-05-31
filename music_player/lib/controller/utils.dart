class Utils {
  static String formatSongDuration(double duration) {
    if (duration == null || duration == 0) {
      return '';
    }

    Duration _duration = Duration(seconds: duration.ceil());
    return _duration.toString().substring(2, 7);
  }
}
