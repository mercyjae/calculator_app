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
   // final color = getTextColor(text);
    final double fontSize = Utils.isOperator(text) && text == "=" ? 20 : 22;
    final style = TextStyle(
         fontSize: fontSize, fontWeight: FontWeight.bold);
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: onclicked,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: text == "<"
                ? const Icon(
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
  Color getTextColor(String buttonText, ) {
    bool _isTheme = false;
  switch (buttonText) {
  
    case "-":
    case "-":
    case "*":
    case "+":
    case "=":
      return _isTheme ? Colors.black : Colors.white;
    case "AC":
    case "<":
      return Colors.blue;
    default:
      return Colors.white;
  }
}
}




