import 'package:flutter/material.dart';
import 'package:hangman/game_screen.dart';
import 'package:get/get.dart';

void main(){
  runApp(Hangman());
}

class Hangman extends StatelessWidget {
  const Hangman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: GameScreen(),
    );
  }
}
