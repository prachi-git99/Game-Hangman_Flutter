import 'package:flutter/material.dart';
import 'package:hangman/constant/constant.dart';
import 'package:hangman/game/figure_widget.dart';
import 'package:hangman/game/gameover.dart';
import 'package:hangman/game/hidden_letters.dart';
import 'package:get/get.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}



class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwstz".toUpperCase();
  var word ="prachi".toUpperCase();
  List<String> selectedChar =[];
  var tries=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("Hangman : The Game",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Expanded(
            flex:3,
              child:Column(
                children: [
                  Expanded(
                      flex:4,
                      child:Container(
                        child: Stack(
                          children: [
                            figure(GameUI.hang,tries>=0),
                            figure(GameUI.head,tries>=1),
                            figure(GameUI.left_hand,tries>=2),
                            figure(GameUI.right_hand,tries>=3),
                            figure(GameUI.body,tries>=4),
                            figure(GameUI.left_leg,tries>=5),
                            figure(GameUI.right_leg,tries>=6),
                          ],
                        ),
                      )

                  ),
                  Expanded(
                      child:Container(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:
                              word
                              .split("")
                              .map((e) => hiddenLetters(e,selectedChar.contains(e.toUpperCase())))
                              .toList(),
                        ),
                      )
                  ),
                ],
              ),
          ),
          Expanded(
            flex:2,
            child:Container(
              padding: EdgeInsets.all(8.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount:7,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children:characters.split("").map((e){
                  return ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                    ),
                      onPressed: selectedChar.contains (e.toUpperCase()) ? null: (){
                      setState(() {
                        selectedChar.add(e.toUpperCase());
                        if(!word.split("").contains(e.toUpperCase())){
                          tries++;
                          print(tries);
                          if(tries>6){
                            Get.to(()=>GameOver());
                          }
                        }

                      });

                      },
                      child:Text(e,style: TextStyle(
                        fontSize:18,
                        fontWeight: FontWeight.bold,

                      ),)
                  );
                }).toList(),

              ),
            ),
          ),
        ],
      ) ,
    );
  }
}
