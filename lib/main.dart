import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shut_the_box/providers/dice_provider.dart';
import 'package:shut_the_box/providers/gamestate_provider.dart';
import 'package:shut_the_box/providers/piece_provider.dart';
import 'package:shut_the_box/screens/splash/splash.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameStateProvider()),
        ChangeNotifierProvider(create: (_) => DiceProvider()),
        ChangeNotifierProvider(create: (_) => PieceProvider()),
      ],
      child: const ShutTheBox(),
    ),
  );
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
