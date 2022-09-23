import 'package:calculator/utils.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onclicked;

  final bool isTheme;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onclicked,
    this.isTheme = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = getTextColor(text, isTheme);
    final double fontSize = Utils.isOperator(text) && text == "=" ? 20 : 22;
    final style = TextStyle(
         fontSize: fontSize, fontWeight: FontWeight.bold,color: color);
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
                ?  Icon(
                    Icons.backspace_outlined,
           color:     isTheme ?Colors.green.shade900: Colors.green,
                  )
                : Text(
                    text,
                    style: style,
                  )),
      ),
    );
  }
  Color getTextColor(String buttonText, bool isTheme) {
  switch (buttonText) {
    case "-":
    case "/":
    case "x":
    case "+":
    case "=":
      return  isTheme?Colors.red: Colors.red.shade900;
    case "AC":
    case "<":
      return isTheme?Colors.red:  Colors.red.shade900;
    case "DEL":
    return isTheme? Colors.amber:  Colors.amber.shade500;
    default:
      return isTheme ?Colors.black: Colors.white;
  }
}
}




