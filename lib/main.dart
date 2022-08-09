import 'package:calculator/button_widget.dart';
import 'package:calculator/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Calculator());
  }
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA020F0),
      appBar: AppBar(backgroundColor: Color(0xFFA020F0), elevation: 0),
      body: Column(children: [
        Expanded(child: buildResult()),
        Expanded(flex: 2, child: buildButton())
      ]),
    );
  }

  Widget buildResult() {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(calculatorProvider);
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              state.equation,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              state.result,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      );
    });
  }

  Widget buildButton() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(children: [
        buildButtonRow(["AC", "<", "", "/"]),
        buildButtonRow(["7", "8", "9", "x"]),
        buildButtonRow(["4", "5", "6", "-"]),
        buildButtonRow(["1", "2", "3", "+"]),
        buildButtonRow(["0", ".", "", "="]),
      ]),
    );
  }

  Widget buildButtonRow(List<String> row) {
    return Consumer(builder: (context, ref, _) {
      final notifier = ref.read(calculatorProvider.notifier);
      final state = ref.watch(calculatorProvider);
      return Expanded(
        child: Row(
            children: row
                .map((text) => ButtonWidget(
                      text: text,
                      onclicked: () {
                        if (text == "<") {
                          notifier.delete();
                        } else if (text == "AC") {
                          notifier.clear();
                        } else if (text == "=") {
                          notifier.calculate();
                        } else {
                          ref.read(calculatorProvider.notifier).append(text);
                        }
                      },
                    ))
                .toList()),
      );
    });
  }

// void onClickedButton() {
//   final calculator = context.read(calculatorProvider);
//   calculator.append(buttonText)
// }
}
