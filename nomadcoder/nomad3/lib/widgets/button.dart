
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(this.text,this.bgcolor,this.txtColor,{Key? key}) : super(key: key);

  String text;
  Color bgcolor;
  Color txtColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 40,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: txtColor,
          ),
        ),
      ),
    );
  }
}
