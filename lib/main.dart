import 'package:flutter/material.dart';
import 'package:shut_the_box/screens/splash/splash.dart';

void main() {
  runApp(const ShutTheBox());
}

class ShutTheBox extends StatelessWidget {
  const ShutTheBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
