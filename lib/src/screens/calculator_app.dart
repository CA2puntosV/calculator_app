import 'package:calculator_app/src/bloc/calculator_bloc.dart';
import 'package:calculator_app/src/widgets/calculator_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textToDisplay = '';
  String _res = '';
  String operation = '';
  CalculatorBloc calculatorBloc = CalculatorBloc();

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == '+' || btnVal == '-' || btnVal == 'X' || btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      _res = '0';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        _res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        _res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        _res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        _res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      _res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = _res;
    });
  }

  void allClear(String btnVal) {
    print('Everything was cleared');
    firstNum = 0;
    secondNum = 0;
    history = '';
    textToDisplay = '';
    _res = '';
    operation = '';

    setState(() {
      textToDisplay = _res;
    });
  }

  void clear(String btnVal) {
    print('Cleared last operation');
    firstNum = 0;
    secondNum = 0;
    textToDisplay = '';
    _res = '';
    operation = '';

    setState(() {
      textToDisplay = _res;
    });
  }

  void eraser(String text) {
    print('Cleared last number');
    _res = textToDisplay.substring(0, textToDisplay.length - 1);

    setState(() {
      textToDisplay = _res;
    });
  }

  @override
  Widget build(BuildContext context) {
    final calcItemRowOne = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CalculatorButton(
          text: 'AC',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: allClear,
        ),
        CalculatorButton(
          text: 'C',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: clear,
        ),
        CalculatorButton(
          text: '<',
          fillColor: 0xFF69486c,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: eraser,
        ),
        CalculatorButton(
          text: '/',
          fillColor: 0xFF69486c,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('/');
            });
          },
        ),
      ],
    );
    final calcItemRowTwo = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CalculatorButton(
          text: '9',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: btnOnClick,
        ),
        CalculatorButton(
            text: '8',
            fillColor: 0xFFfdff91,
            textColor: 0xFF000000,
            textSize: 22.0,
            callback: btnOnClick),
        CalculatorButton(
            text: '7',
            fillColor: 0xFFfdff91,
            textColor: 0xFF000000,
            textSize: 22.0,
            callback: btnOnClick),
        CalculatorButton(
            text: 'X',
            fillColor: 0xFF69486c,
            textColor: 0xFF000000,
            textSize: 22.0,
            callback: btnOnClick),
      ],
    );
    final calcItemRowThree = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CalculatorButton(
          text: '6',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: btnOnClick,
        ),
        CalculatorButton(
          text: '5',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: btnOnClick,
        ),
        CalculatorButton(
          text: '4',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: btnOnClick,
        ),
        CalculatorButton(
          text: '-',
          fillColor: 0xFF69486c,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: btnOnClick,
        ),
      ],
    );
    final calcItemRowFour = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CalculatorButton(
          text: '3',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: btnOnClick,
        ),
        CalculatorButton(
          text: '2',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: btnOnClick,
        ),
        CalculatorButton(
          text: '1',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: btnOnClick,
        ),
        CalculatorButton(
          text: '+',
          fillColor: 0xFF69486c,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: btnOnClick,
        ),
      ],
    );
    final calcItemRowFive = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CalculatorButton(
          text: '0',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('0');
            });
          },
        ),
        CalculatorButton(
          text: '00',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('00');
            });
          },
        ),
        CalculatorButton(
          text: '=',
          fillColor: 0xFF69486c,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('=');
            });
          },
        ),
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.center,
              colors: [
                Color(0xFF020927),
                Color(0xFF4c565e),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Text(
                    history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                    right: 12.0,
                    bottom: 12.0,
                    left: 12.0,
                  ),
                  child: Text(
                    textToDisplay,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    calcItemRowOne,
                    calcItemRowTwo,
                    calcItemRowThree,
                    calcItemRowFour,
                    calcItemRowFive,
                  ],
                ),
              ),
              // SizedBox(height: 3.0),
            ],
          ),
        ),
      ),
    );
  }
}
