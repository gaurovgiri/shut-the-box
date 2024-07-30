import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shut_the_box/providers/gamestate_provider.dart';
import 'package:shut_the_box/screens/game/widgets/board.dart';
import 'package:shut_the_box/screens/game/widgets/counter.dart';
import 'package:shut_the_box/shared/colors.dart';

class Game extends StatelessWidget {
  const Game({super.key});
  static const double opacityValue = 0.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.background,
        body: Consumer<GameStateProvider>(
          builder: (context, value, child) {
            return Stack(
              children: [
                Opacity(
                    opacity:
                        value.gameStarted && !value.gameOver ? 1 : opacityValue,
                    child: const Board()),
                const Counter()
              ],
            );
          },
        ));
  }
}
