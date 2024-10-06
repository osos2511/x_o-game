import 'package:flutter/material.dart';
import 'package:x_o_game/start_game_screen.dart';
import 'board_button.dart';

class BoardScreen extends StatefulWidget {
  BoardScreen({super.key});
  static const String routeName = 'boardScreen/';
  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];
  int Player1Score = 0;
  int Player2Score = 0;

  @override
  Widget build(BuildContext context) {
    StartGameArgs args=ModalRoute.of(context)?.settings.arguments as StartGameArgs;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          leading: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          elevation: 0,
          title: const Text(
            'XO Game',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        args.player1Name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold,color: counter%2==0?Colors.brown:Colors.black),),
                      SizedBox(height:10),
                      Text('Score: $Player1Score',
                          style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(args.player2Name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold,color: counter%2!=0?Colors.brown:Colors.black),),
                      const SizedBox(height:10),
                      Text('Score: $Player2Score',
                          style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(
                    btnText: boardState[0],
                    onBoardButtonClicked: onButtonClicked,
                    index: 0,
                  ),
                  BoardButton(
                    btnText: boardState[1],
                    onBoardButtonClicked: onButtonClicked,
                    index: 1,
                  ),
                  BoardButton(
                    btnText: boardState[2],
                    onBoardButtonClicked: onButtonClicked,
                    index: 2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(
                    btnText: boardState[3],
                    onBoardButtonClicked: onButtonClicked,
                    index: 3,
                  ),
                  BoardButton(
                    btnText: boardState[4],
                    onBoardButtonClicked: onButtonClicked,
                    index: 4,
                  ),
                  BoardButton(
                    btnText: boardState[5],
                    onBoardButtonClicked: onButtonClicked,
                    index: 5,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(
                    btnText: boardState[6],
                    onBoardButtonClicked: onButtonClicked,
                    index: 6,
                  ),
                  BoardButton(
                    btnText: boardState[7],
                    onBoardButtonClicked: onButtonClicked,
                    index: 7,
                  ),
                  BoardButton(
                    btnText: boardState[8],
                    onBoardButtonClicked: onButtonClicked,
                    index: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int counter = 0;
  void onButtonClicked(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    String currentPlayer = counter.isEven ? 'X' : 'O';
    boardState[index] = currentPlayer;
    counter++;
    if(CheckWinner('X')){
      Player1Score += 10;
      clearBoard();
    }else if(CheckWinner('O')){
      Player2Score += 10;
      clearBoard();
    }else if(counter == 9){
      clearBoard();
    }

    setState(() {});
  }

  bool CheckWinner(String symbol) {
    symbol.toLowerCase();
    for (int i = 0; i <= 6; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i <= 2; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  clearBoard() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    setState(() {});
  }
}
