// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shut_the_box/screens/home/home.dart';
import 'package:shut_the_box/screens/game/game.dart';

void main() {
  testWidgets('Play Button navigates to Game screen',
      (WidgetTester tester) async {
    // Build the Home widget wrapped in a MaterialApp.
    await tester.pumpWidget(MaterialApp(home: Home()));

    // Verify that the Home screen is displayed.
    expect(find.byType(Home), findsOneWidget);

    // Find the Play button and tap it.
    final playButton = find.text('Play');
    expect(playButton, findsOneWidget);
    await tester.tap(playButton);

    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // Verify that the Game screen is displayed.
    expect(find.byType(Game), findsOneWidget);
  });
}
