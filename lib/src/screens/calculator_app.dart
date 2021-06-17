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
  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textToDisplay = '';
  String operation = '';

  final calculatorBloc = CalculatorBloc();

  int _buildSecondOperand(String value) {
    return int.parse(secondNum.toString() + value);
  }

  @override
  Widget build(BuildContext context) {
    Widget calcItemRowOne() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CalculatorButton(
              text: 'AC',
              fillColor: 0xFFfbb92b,
              textColor: 0xFF000000,
              textSize: 22.0,
              callback: () {
                setState(() {
                  firstNum = 0;
                  secondNum = 0;
                  history = '';
                  textToDisplay = '';
                  operation = '';
                });
              },
            ),
            CalculatorButton(
              text: 'C',
              fillColor: 0xFFfbb92b,
              textColor: 0xFF000000,
              textSize: 22.0,
              callback: () {
                setState(() {
                  textToDisplay = calculatorBloc.btnOnClick('C');
                });
              },
            ),
            CalculatorButton(
                text: '<',
                fillColor: 0xFF8e28dc,
                textColor: 0xFFfef9ff,
                textSize: 22.0,
                callback: () {
                  setState(() {
                    textToDisplay = calculatorBloc.eraser(textToDisplay);
                  });
                }),
            CalculatorButton(
              text: '/',
              fillColor: 0xFF8e28dc,
              textColor: 0xFFfef9ff,
              textSize: 22.0,
              callback: () {
                setState(() {
                  firstNum = int.parse(textToDisplay);
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('/');
                  operation = '/';
                });
              },
            ),
          ],
        );
    Widget calcItemRowTwo() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CalculatorButton(
              text: '9',
              fillColor: 0xFFfdff91,
              textColor: 0xFF000000,
              textSize: 22.0,
              callback: () {
                setState(() {
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('9');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('9');
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
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('8');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('8');
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
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('7');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('7');
                });
              },
            ),
            CalculatorButton(
              text: 'X',
              fillColor: 0xFF8e28dc,
              textColor: 0xFFfef9ff,
              textSize: 22.0,
              callback: () {
                setState(() {
                  firstNum = int.parse(textToDisplay);
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('X');
                  operation = 'X';
                });
              },
            ),
          ],
        );
    Widget calcItemRowThree() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CalculatorButton(
              text: '6',
              fillColor: 0xFFfdff91,
              textColor: 0xFF000000,
              textSize: 22.0,
              callback: () {
                setState(() {
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('6');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('6');
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
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('5');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('5');
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
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('4');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('4');
                });
              },
            ),
            CalculatorButton(
              text: '-',
              fillColor: 0xFF8e28dc,
              textColor: 0xFFfef9ff,
              textSize: 22.0,
              callback: () {
                setState(() {
                  firstNum = int.parse(textToDisplay);
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('-');
                  operation = '-';
                });
              },
            ),
          ],
        );
    Widget calcItemRowFour() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CalculatorButton(
              text: '3',
              fillColor: 0xFFfdff91,
              textColor: 0xFF000000,
              textSize: 22.0,
              callback: () {
                setState(() {
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('3');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('3');
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
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('2');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('2');
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
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('1');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('1');
                });
              },
            ),
            CalculatorButton(
              text: '+',
              fillColor: 0xFF8e28dc,
              textColor: 0xFFfef9ff,
              textSize: 22.0,
              callback: () {
                setState(() {
                  firstNum = int.parse(textToDisplay);
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('+');
                  operation = '+';
                });
              },
            ),
          ],
        );
    Widget calcItemRowFive() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CalculatorButton(
              text: '0',
              fillColor: 0xFFfdff91,
              textColor: 0xFF000000,
              textSize: 22.0,
              callback: () {
                setState(() {
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('0');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('0');
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
                  textToDisplay =
                      textToDisplay + calculatorBloc.btnOnClick('00');
                  if (operation.isNotEmpty)
                    secondNum = _buildSecondOperand('00');
                });
              },
            ),
            SizedBox(
              width: 65 * 2.5,
              child: CalculatorButton(
                text: '=',
                fillColor: 0xFF9b2bf0,
                textColor: 0xFFf5e1fd,
                textSize: 22.0,
                callback: () {
                  setState(
                    () {
                      textToDisplay = calculatorBloc.operate(
                        firstNum,
                        secondNum,
                        operation,
                      );
                      firstNum = int.parse(textToDisplay);
                      secondNum = 0;
                      operation = '';
                      history = textToDisplay;
                    },
                  );
                },
              ),
            ),
          ],
        );

    Widget numbersContainer() => Container(
          margin: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          height: 165.0,
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
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
            ],
          ),
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 25.0,
              fontFamily: 'DoHyeon',
            ),
          ),
          backgroundColor: Color(0xFF4c565e),
          elevation: 0.0,
          centerTitle: true,
        ),
        // extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF4c565e),
          ),
          child: Column(
            children: <Widget>[
              numbersContainer(),
              SizedBox(height: 10.0),
              Container(
                child: Column(
                  children: <Widget>[
                    calcItemRowOne(),
                    calcItemRowTwo(),
                    calcItemRowThree(),
                    calcItemRowFour(),
                    calcItemRowFive(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
