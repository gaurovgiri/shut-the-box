import 'package:flutter/material.dart';

import 'package:shut_the_box/shared/colors.dart';
import 'package:shut_the_box/shared/styles.dart';

class RollButton extends StatelessWidget {
  const RollButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: WidgetStateProperty.all<double>(20),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              backgroundColor:
                  WidgetStateProperty.all<Color>(Palette.buttonColor)),
          onPressed: () {},
          child: const Text(
            "Roll 🎲",
            style: Styles.title,
            textAlign: TextAlign.center,
          )),
    );
  }
}
