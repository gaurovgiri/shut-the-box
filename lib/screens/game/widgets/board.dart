import 'package:flutter/material.dart';
import 'package:shut_the_box/screens/game/widgets/bar.dart';
import 'package:shut_the_box/screens/game/widgets/piece.dart';
import 'package:shut_the_box/screens/game/widgets/roll_button.dart';
import 'package:shut_the_box/shared/colors.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        const Bar(),
        const Pieces(),
        Container(
          height: 300,
          decoration: const BoxDecoration(color: Palette.gameBoard),
        ),
        const Bar(),
        const SizedBox(
          height: 50,
        ),
        const RollButton()
      ],
    );
  }
}
