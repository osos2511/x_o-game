import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({super.key,required this.labelTxt,required this.controller});
String labelTxt;
   TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (input) {
      if (input == null || input.trim().isEmpty) {
        return 'Please, enter your name';
      }if(input.trim().length<4){
        return 'Name, Should be at least 4 chars';
      }
      return null;
    },
      decoration: InputDecoration(
        labelText: labelTxt,
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
      ),
    );
  }
}
