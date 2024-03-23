import 'package:hive/hive.dart';

class HighScoreManager {
  static Box<int>? _box;

  static Future<void> init() async {
    _box = await Hive.openBox<int>('highScores');
  }

  static int getHighScore() {
    // Assuming 'highScore' is the key for storing the high score
    return _box?.get('highScore', defaultValue: 0) ?? 0;
  }

  static Future<void> setHighScore(int score) async {
    final currentHighScore = getHighScore();
    if (score > currentHighScore) {
      await _box?.put('highScore', score);
    }
  }
}
