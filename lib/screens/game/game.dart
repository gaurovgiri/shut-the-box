import 'package:flutter/material.dart';
import 'package:shut_the_box/screens/game/widgets/board.dart';
import 'package:shut_the_box/screens/game/widgets/counter.dart';
import 'package:shut_the_box/shared/colors.dart';

class Game extends StatelessWidget {
  const Game({super.key});
  static double opacityValue = 0.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: Stack(
        children: [Opacity(opacity: opacityValue, child: Board()), Counter()],
      ),
    );
  }
}
