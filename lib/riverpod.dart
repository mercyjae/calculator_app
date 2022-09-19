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
    state = state.copy(equation: equation.substring(0, equation.length - 1));
  }

  // void equals() {
  //   calculate();
  // }

  void calculate() {
    final expression = state.equation.replaceAll("x", "*").replaceAll("+", "/");
    final exp = Parser().parse(expression);
    final model = ContextModel();
    final result = "${exp.evaluate(EvaluationType.REAL, model)}";
    state = state.copy(result: result);
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:payjaro_flutter/src/app/theme/colors.dart';
// import 'package:payjaro_flutter/src/features/trovi/ui/user_reward/view/screens/widgets/user_reward_widget.dart';
// import 'package:payjaro_flutter/src/global/ui/ui_barrel.dart';
// import 'package:payjaro_flutter/src/global/ui/widgets/button/filled_button.dart';
// import 'package:payjaro_flutter/src/global/ui/widgets/text/app_text.dart';
// import 'package:payjaro_flutter/src/utils/constants/assets/assets.dart';
//
// import '../../../../../../global/ui/widgets/button/outlined_button.dart';
//
// class TroviDiscount extends StatelessWidget {
//   const TroviDiscount({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(appBar: PreferredSize(preferredSize: Size.fromHeight(100),
//       child: AppBar(  leading: IconButton(
//         icon: SvgPicture.asset(Assets.backArrowIcon,color: AppColors.white,),
//         onPressed: () {},
//       ),title: AppText.bold('My Rewards',),centerTitle: true,
//         backgroundColor: AppColors.primryColor,),
//     ),
//       body: Column(
//         children: [
//           Container(color: AppColors.grey300,
//             height: 170,
//             child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(child: Ui.boxHeight(10)),
//                   AppText.semiBold('Total balance'),
//                   Ui.boxHeight(8),
//                   AppText.semiBold('0.00',color: AppColors.primryColor,fontSize: 25),
//                   Ui.boxHeight(20),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal:20),
//                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(child: FilledButton(onPressed: (){},
//                             child: AppText.medium('Trovi discounts',
//                                 color: AppColors.white))),
//                         Ui.boxWidth(70),
//                         Expanded(child: AppOutlinedButton(onPressed: (){},
//                             child: AppText.medium('Cashbacks',color: AppColors.primryColor)))
//                       ],),
//                   ),
//
//
//
//                 ]),
//           ),
//           Ui.boxHeight(20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 UserRewardWidget(title: '3% cashback from order #23',
//                   subtitle: 'From Payjaro with',),
//                 UserRewardWidget(title: '5% cashback from order #12',
//                   subtitle: 'From MarketSquare with',),
//                 UserRewardWidget(title: '2% cashback from order #3',
//                   subtitle: 'From OrangeStar with',),
//                 UserRewardWidget(title: '1% cashback from order #4',
//                   subtitle: 'From MarketSquare with',),
//               ],
//             ),
//           )
//
//
//         ],
//       ),
//     );
//   }
// }
