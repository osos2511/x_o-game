import 'package:flutter/material.dart';
import 'package:x_o_game/board_screen.dart';
import 'package:x_o_game/start_game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        BoardScreen.routeName:(context)=>BoardScreen(),
        StartGameScreen.routeName:(_)=>StartGameScreen(),
      },
    );
  }
}
