import 'package:flutter/material.dart';
import 'package:shut_the_box/screens/game/widgets/board.dart';
import 'package:shut_the_box/screens/game/widgets/counter.dart';
import 'package:shut_the_box/shared/colors.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.background,
      body: Stack(
        children: [Board(), Counter()],
      ),
    );
  }
}
