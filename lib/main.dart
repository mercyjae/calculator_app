import 'package:calculator/button_widget.dart';
import 'package:calculator/riverpod.dart';
import 'package:calculator/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isTheme = false;
  @override
  Widget build(BuildContext context) { 
 return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
             theme: _isTheme ? MyTheme.lightTheme :  MyTheme.darkTheme,
            home: Scaffold( 
          appBar: AppBar(
          title: Center(child: InkWell(onTap: (){
          setState(() {
            _isTheme = !_isTheme;
          });  
          },
            child: _isTheme?SvgPicture.asset('assets/icons/sun.svg',color: Colors.black,):
            SvgPicture.asset('assets/icons/moon.svg',color: Colors.white,))),
          elevation: 0),
          body: Column(children: [
        
           Expanded(child: buildResult()),
           Expanded(flex: 2, child: buildButton())
          ]),
        ));
     
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
              style:  TextStyle( fontSize: 36),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              state.result,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(
               fontSize: 18),
            )
          ],
        ),
      );
    });
  }

  Widget buildButton() {
    return Container(
      decoration:  BoxDecoration(
      color: _isTheme? Colors.grey: Color(0xFF3A3B3C),
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


}


  







