import 'package:flutter/material.dart';

class MusicPlayerModel with ChangeNotifier {
  bool _playing = false;
  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _current = const Duration(milliseconds: 0);

  bool get isPlaying => _playing;

  Duration get songDuration => _songDuration;
  Duration get current => _current;

  String get totalDuration => printDuration(_songDuration);
  String get currentDuration => printDuration(_current);

  double get progress {
    final total = _songDuration.inSeconds;
    final current = _current.inSeconds;
    if (total > 0) {
      return current / total;
    } else {
      return 0.0;
    }
  }

  set isPlaying(bool value) {
    _playing = value;
    notifyListeners();
  }

  set songDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }

  set current(Duration value) {
    _current = value;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    final twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitsMinutes:$twoDigitsSeconds';
  }
}
