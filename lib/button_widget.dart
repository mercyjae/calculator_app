import 'package:calculator/utils.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onclicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onclicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = getTextColor(text);
    final double fontSize = Utils.isOperator(text) && text == "=" ? 26 : 22;
    final style = TextStyle(
        color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: onclicked,
            style: ElevatedButton.styleFrom(
                primary: Colors.black38,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: text == "<"
                ? Icon(
                    Icons.backspace_outlined,
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: style,
                  )),
      ),
    );
  }
}

Color getTextColor(String buttonText) {
  switch (buttonText) {
    case "-":
    case "-":
    case "*":
    case "+":
    case "=":
      return Colors.red;
    case "AC":
    case "<":
      return Colors.blue;
    default:
      return Colors.white;
  }
}
