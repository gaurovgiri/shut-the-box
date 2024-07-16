import 'package:flutter/material.dart';
import 'package:shut_the_box/screens/game/game.dart';
import 'package:shut_the_box/shared/colors.dart';
import 'package:shut_the_box/shared/styles.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all<double>(20),
            shadowColor: WidgetStateProperty.all<Color>(Colors.black),
            backgroundColor:
                WidgetStateProperty.all<Color>(Palette.buttonColor)),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return Game();
          }));
        },
        child: const Text(
          "Play",
          style: Styles.title,
        ));
  }
}
