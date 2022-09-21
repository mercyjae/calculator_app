import 'package:calculator/calculator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, Calculators>(
        (ref) => CalculatorNotifier());
// final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeColor>((ref)
//  =>ThemeNotifier());
class CalculatorNotifier extends StateNotifier<Calculators> {
  CalculatorNotifier() : super(Calculators());
  void append(String buttonText) {
    final equation = () {
      switch (buttonText) {
        case "+":
        case "-":
        case "x":
        case "/":
          if (state.equation.endsWith("+") ||
              state.equation.endsWith("-") ||
              state.equation.endsWith("x") ||
              state.equation.endsWith("/")) {
            delete();
          }
          return state.equation + buttonText;
        default:
          if (state.equation == "0") {
            return buttonText;
          }
          return state.equation + buttonText;
      }
    }();
    state = state.copy(equation: equation);
  }

  void clear() {
    state = state.copy(equation: "",result: '');
  }

  void delete() {
    final equation = state.equation;
    state = state.copy(equation: equation.substring(0, equation.length - 1),
    result: '');
  }

  void calculate() {
    final expression = state.equation.replaceAll("x", "*").replaceAll("+", "/");
    final exp = Parser().parse(expression);
    final model = ContextModel();
    final result = "${exp.evaluate(EvaluationType.REAL, model)}";
    state = state.copy(result: result);
  }
}
