import 'package:flutter/material.dart';
import 'package:x_o_game/board_screen.dart';
import 'package:x_o_game/custom_textformfield.dart';

class StartGameScreen extends StatefulWidget {
  StartGameScreen({super.key});
  static const String routeName = '/';

  @override
  State<StartGameScreen> createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen> {
  var player1NameController = TextEditingController();
  var player2NameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/xo_game.jpg')),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomTextFormField(
                          controller: player1NameController, labelTxt: 'First Player'),
                      const SizedBox(height: 12),
                      CustomTextFormField(
                          controller: player2NameController, labelTxt: 'Second Player'),
                      const SizedBox(height: 12),
      
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: double.infinity,
                        child: ElevatedButton(
                          style:ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 60),backgroundColor: Colors.brown),
                          onPressed: navigate,
                          child: Text('Start Game',style: TextStyle(fontSize: 18,color: Colors.white),),
                        ),
                      ),
      
                    ],
                  ),
                ),
      
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigate() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Navigator.pushNamed(
      context,
      BoardScreen.routeName,
      arguments: StartGameArgs(
          player1Name: player1NameController.text,
          player2Name: player2NameController.text),
    );
  }
}

class StartGameArgs {
  String player1Name;
  String player2Name;
  StartGameArgs({required this.player1Name, required this.player2Name});
}
