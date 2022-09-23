import 'package:calculator/calculator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, Calculators>(
        (ref) => CalculatorNotifier());
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
    if(equation.isNotEmpty){
      final newEquation =  equation.substring(0, equation.length - 1);
      if(newEquation.isEmpty){
        reset();
      }else{
      state = state.copy(equation: newEquation);
      calculate();
       } }
    
  }

void reset(){
  const equation = '0';
  const result = '0';
  state = state.copy(equation: equation, result: result);
}
  void calculate() {
    final expression = state.equation.replaceAll("x", "*").replaceAll("+", "/");
   try{
    final exp = Parser().parse(expression);
    final model = ContextModel();
    final result = "${exp.evaluate(EvaluationType.REAL, model)}";
    state = state.copy(result: result);
   }catch(e){
    print(e);
   }
  }
}
