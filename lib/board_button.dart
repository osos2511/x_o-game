import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
   BoardButton({required this.btnText,required this.onBoardButtonClicked,required this.index});
  String btnText;
  Function onBoardButtonClicked;
  int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin:  EdgeInsets.all(2),
          child: ElevatedButton(onPressed: (){

            onBoardButtonClicked(index);
          },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
            child:  Text(btnText,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),)),
    );
  }
}
