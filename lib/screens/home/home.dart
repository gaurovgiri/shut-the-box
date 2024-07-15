import 'package:flutter/material.dart';
import 'package:shut_the_box/screens/home/widgets/playbutton.dart';
import 'package:shut_the_box/shared/colors.dart';
import 'package:shut_the_box/shared/footer.dart';
import 'package:shut_the_box/shared/logo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.background,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 100,
            child: Logo(rotate: false),
          ),
          SizedBox(
            height: 300,
          ),
          SizedBox(
            height: 75,
            width: 200,
            child: PlayButton(),
          ),
          SizedBox(
            height: 200,
          ),
          SizedBox(child: Footer())
        ],
      ),
    );
  }
}
