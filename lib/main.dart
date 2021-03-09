import 'package:calculator_flutter/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  CalcApp({Key key}) : super(key: key);
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {

  String _history ='';
  String _expression='';

  void numClick(String text){
    setState(() {
      _expression += text;
    });
  }
  void allClear(String text){
    setState(() {
      _history = '';
      _expression = '';
    });
  }
  void clear(String text){
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 24,
                  ),
                  color: Color(0xFF545F61),
                ),
              ),
              alignment: Alignment(1,1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 48,
                  ),
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1,1),
            ),
            SizedBox(height: 40,),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              CalcButton(
                text: "Ac",
                callback: allClear,
                textSize: 20,
                fillColor: 0xFF6C807F,
              ),
              CalcButton(
                text: "C",
                callback: clear,
                fillColor: 0xFF6C807F,
              ),
              CalcButton(
                text: "%",
                callback: numClick,
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
              CalcButton(
                text: "/",
                callback: numClick,
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              CalcButton(
                text: "7",
                callback: numClick,
              ),
              CalcButton(
                text: "8",
                callback: numClick,
              ),
              CalcButton(
                text: "9",
                callback: numClick,
              ),
              CalcButton(
                text: "*",
                callback: numClick,
                textSize: 24,
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              CalcButton(
                text: "4",
                callback: numClick,
              ),
              CalcButton(
                text: "5",
                callback: numClick,
              ),
              CalcButton(
                text: "6",
                callback: numClick,
              ),
              CalcButton(
                text: "-",
                callback: numClick,
                textSize: 38,
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              CalcButton(
                text: "1",
                callback: numClick,
              ),
              CalcButton(
                text: "2",
                callback: numClick,
              ),
              CalcButton(
                text: "3",
                callback: numClick,
              ),
              CalcButton(
                text: "+",
                callback: numClick,
                textSize: 30,
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              CalcButton(
                text: ".",
                callback: numClick,
              ),
              CalcButton(
                text: "0",
                callback: numClick,
              ),
              CalcButton(
                text: "00",
                callback: numClick,
                textSize: 22,
              ),
              CalcButton(
                text: "=",
                callback: evaluate,
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ],
          ),
          ],
        ),
    ),
  );
}
}
