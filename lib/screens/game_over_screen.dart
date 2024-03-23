import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/game/high_score_manager.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatefulWidget {
  final FlappyBirdGame game;

  const GameOverScreen({Key? key, required this.game}) : super(key: key);

  @override
  State<GameOverScreen> createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {
  @override
  Widget build(BuildContext context) {
    int highScore =
        HighScoreManager.getHighScore(); // Fetch high score dynamically
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'High Score: ${highScore}',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            Text(
              'Score: ${widget.game.bird.score}',
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text(
                'Restart',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onRestart() {
    widget.game.bird.reset();

    widget.game.overlays.remove('gameOver');
    widget.game.resumeEngine();
  }
}
