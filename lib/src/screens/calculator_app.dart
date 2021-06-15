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
          fillColor: 0xFFfbb92b,
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
          fillColor: 0xFFfbb92b,
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
          fillColor: 0xFF8e28dc,
          textColor: 0xFFfef9ff,
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
          fillColor: 0xFF8e28dc,
          textColor: 0xFFfef9ff,
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
          fillColor: 0xFF8e28dc,
          textColor: 0xFFfef9ff,
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
        SizedBox(
          width: 65 * 2.5,
          child: CalculatorButton(
            text: '=',
            fillColor: 0xFF9b2bf0,
            textColor: 0xFFf5e1fd,
            textSize: 22.0,
            callback: () {
              setState(() {
                textToDisplay = calculatorBloc.btnOnClick('=');
              });
            },
          ),
        ),
      ],
    );

    final numbersContainer = Container(
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
              numbersContainer,
              SizedBox(height: 10.0),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
