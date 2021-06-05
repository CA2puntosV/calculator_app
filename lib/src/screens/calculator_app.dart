import 'package:calculator_app/src/widgets/calculator_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/calculator_bloc.dart';

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String history = '';
  String textToDisplay = '';
  CalculatorBloc calculatorBloc = CalculatorBloc();

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
          callback: () {
            setState(() {
              calculatorBloc.allClear(
                history: history,
                textToDisplay: textToDisplay,
              );
            });
          },
        ),
        CalculatorButton(
          text: 'C',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              calculatorBloc.clear(textToDisplay);
            });
          },
        ),
        CalculatorButton(
            text: '<',
            fillColor: 0xFF69486c,
            textColor: 0xFF000000,
            textSize: 22.0,
            callback: () {
              setState(() {
                textToDisplay = calculatorBloc.eraser(textToDisplay);
              });
            }),
        CalculatorButton(
          text: '/',
          fillColor: 0xFF69486c,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('/ol');
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
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('9');
            });
          },
        ),
        CalculatorButton(
          text: '8',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('8');
            });
          },
        ),
        CalculatorButton(
          text: '7',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('7');
            });
          },
        ),
        CalculatorButton(
          text: 'X',
          fillColor: 0xFF69486c,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('X');
            });
          },
        ),
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
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('6');
            });
          },
        ),
        CalculatorButton(
          text: '5',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('5');
            });
          },
        ),
        CalculatorButton(
          text: '4',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('4');
            });
          },
        ),
        CalculatorButton(
          text: '-',
          fillColor: 0xFF69486c,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('-');
            });
          },
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
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('3');
            });
          },
        ),
        CalculatorButton(
          text: '2',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('2');
            });
          },
        ),
        CalculatorButton(
          text: '1',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('1');
            });
          },
        ),
        CalculatorButton(
          text: '+',
          fillColor: 0xFF69486c,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('+');
            });
          },
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
              textToDisplay = calculatorBloc.btnOnClick('/');
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
              textToDisplay = calculatorBloc.btnOnClick('/');
            });
          },
        ),
        CalculatorButton(
          text: '.',
          fillColor: 0xFFfdff91,
          textColor: 0xFF000000,
          textSize: 22.0,
          callback: () {
            setState(() {
              textToDisplay = calculatorBloc.btnOnClick('/');
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
              textToDisplay = calculatorBloc.btnOnClick('/');
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
