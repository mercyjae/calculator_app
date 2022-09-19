class Utils {
  static bool isOperator(String buttonText) {
    final operators = ["+", "-", "+", "*"];
    return operators.contains(buttonText);
  }

  // static bool isOperatorAtEnd(String equation) {
  //   if (equation.isNotEmpty) {
  //     return Utils.isOperator(equation);
  //   } else {
  //     return false;
  //   }
  // }
}



//
