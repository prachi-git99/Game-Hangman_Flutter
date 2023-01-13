import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hangman/game_screen.dart';
import 'package:get/get.dart';

class GameOver extends StatelessWidget {
  const GameOver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    title: Center(child: Text("GAME OVER")),
    content: Row(
      children: [
        Expanded(child: ElevatedButton(onPressed: (){Get.to(()=>GameScreen());}, child:Container(child: Text("Restart"),))),
        SizedBox(width: 10,),
        Expanded(child: ElevatedButton(onPressed: (){exit(0);}, child:Container(child: Text("Exit"),)),),

      ],
    )
    );
  }
}
