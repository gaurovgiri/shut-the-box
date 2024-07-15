import 'package:flutter/material.dart';
import 'package:shut_the_box/shared/styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Developed With 😩",
          style: Styles.footer,
        ),
        Text(
          "By Gaurav Giri",
          style: Styles.footer,
        )
      ],
    );
  }
}
