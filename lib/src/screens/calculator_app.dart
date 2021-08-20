import 'package:calculator_app/src/adapters/calculator_adapter.dart';
import 'package:flutter/material.dart';
//Our imports
import 'package:google_fonts/google_fonts.dart';
import '../bloc/calculator_bloc.dart';
import 'package:calculator_app/src/widgets/calculator_button.dart';

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  int _firstNum = 0;
  int _secondNum = 0;
  String _history = '';
  String _textToDisplay = '';
  String _operation = '';

  final _calculatorBloc = CalculatorBloc();

  late CalculatorAdapter _calculatorAdapter;

  @override
  void initState() {
    super.initState();
    _calculatorAdapter = CalculatorAdapter(
      buildRow: _buildRow,
      buildWideRow: _buildWideRow,
      getTextToDisplay: () => _textToDisplay,
      getHistory: () => _history,
    );
  }

  int _buildSecondOperand(String value) {
    return int.parse(_secondNum.toString() + value);
  }

  void _assignOperation(String operator) {
    setState(() {
      _firstNum = int.parse(_textToDisplay);
      _textToDisplay = _textToDisplay + _calculatorBloc.btnOnClick(operator);
      _operation = operator;
    });
  }

  void _assignNumber(String number) {
    setState(() {
      _textToDisplay = _textToDisplay + _calculatorBloc.btnOnClick(number);
      if (_operation.isNotEmpty) _secondNum = _buildSecondOperand(number);
      print(_textToDisplay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _calculatorAdapter.build(context);
  }

  Widget _buildRow(int index) {
    String btn1 = '', btn2 = '', btn3 = '', btn4 = '';

    int? color1, color2, color3, color4;
    int? textColor;

    VoidCallback function1 = () {},
        function2 = () {},
        function3 = () {},
        function4 = () {};

    Map<String, int> colors = {
      'mainColor': 0xFFfdff91, //accent
      'mainTextColor': 0xFF000000, //black
      'secondaryTextColor': 0xFFffffff, //white
      'functionsColor': 0xFFfbb92b, //yellow
      'operatorsColor': 0xFF8e28dc, //purple
    };

    if (index == 0) {
      //ASIGNACIÓN DE VALORES (ROW 1)
      btn1 = 'AC';
      btn2 = 'C';
      btn3 = '<';
      btn4 = '/';
      //ASIGNACIÓN DE COLORES (ROW 1)
      color1 = colors['functionsColor'];
      color2 = colors['functionsColor'];
      color3 = colors['operatorsColor'];
      color4 = colors['operatorsColor'];
      textColor = colors['secondaryTextColor'];
      //ASIGNACIÓN DE FUNCIONES
      function1 = () {
        setState(() {
          _firstNum = 0;
          _secondNum = 0;
          _history = '';
          _textToDisplay = '';
          _operation = '';
          print('All was cleared');
        });
      };
      function2 = () {
        setState(() {
          _firstNum = 0;
          _secondNum = 0;
          _textToDisplay = '';
          _operation = '';
          print('Last operation was cleared');
        });
      };
      function3 = () {
        setState(() {
          _textToDisplay = _calculatorBloc.eraser(_textToDisplay);
          print('Cleared last character');
        });
      };
      function4 = () {
        _assignOperation('/');
      };
    } else if (index == 1) {
      //ASIGNACIÓN DE VALORES (ROW 2)
      btn1 = '9';
      btn2 = '8';
      btn3 = '7';
      btn4 = 'X';
      //ASIGNACIÓN DE COLORES (ROW 2)
      color1 = colors['mainColor'];
      color2 = colors['mainColor'];
      color3 = colors['mainColor'];
      color4 = colors['operatorsColor'];
      //ASIGNACIÓN DE FUNCIONES (ROW 2)
      function1 = () {
        _assignNumber('9');
      };
      function2 = () {
        _assignNumber('8');
      };
      function3 = () {
        _assignNumber('7');
      };
      function4 = () {
        _assignOperation('X');
      };
    } else if (index == 2) {
      btn1 = '6';
      btn2 = '5';
      btn3 = '4';
      btn4 = '-';
      //ASIGNACIÓN DE COLORES (ROW 3)
      color1 = colors['mainColor'];
      color2 = colors['mainColor'];
      color3 = colors['mainColor'];
      color4 = colors['operatorsColor'];
      //ASIGNACIÓN DE FUNCIONES (ROW 3)
      function1 = () {
        _assignNumber('6');
      };
      function2 = () {
        _assignNumber('5');
      };
      function3 = () {
        _assignNumber('4');
      };
      function4 = () {
        _assignOperation('-');
      };
    } else if (index == 3) {
      btn1 = '3';
      btn2 = '2';
      btn3 = '1';
      btn4 = '+';
      //ASIGNACIÓN DE COLORES (ROW 4)
      color1 = colors['mainColor'];
      color2 = colors['mainColor'];
      color3 = colors['mainColor'];
      color4 = colors['operatorsColor'];
      //ASIGNACIÓN DE FUNCIONES (ROW 4)
      function1 = () {
        _assignNumber('3');
      };
      function2 = () {
        _assignNumber('2');
      };
      function3 = () {
        _assignNumber('1');
      };
      function4 = () {
        _assignOperation('+');
      };
    } else if (index == 4) {
      //ASIGNACIÓN DE VALORES
      btn1 = '0';
      btn2 = '00';
      btn3 = '=';
      //ASIGNACIÓN DE COLORES (ROW 5)
      color1 = colors['mainColor'];
      color2 = colors['mainColor'];
      color3 = colors['mainColor'];
      color4 = colors['operatorsColor'];
      //ASIGNACIÓN DE FUNCIONES (ROW 5)
      function1 = () {
        _assignNumber('0');
      };
      function2 = () {
        _assignNumber('00');
      };
      function3 = () {
        setState(() {
          _textToDisplay = _calculatorBloc.operate(
            _firstNum,
            _secondNum,
            _operation,
          );
          _firstNum = int.parse(_textToDisplay);
          _secondNum = 0;
          _operation = '';
          _history = _textToDisplay;
          print(_textToDisplay);
        });
      };
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CalculatorButton(
          text: btn1,
          fillColor: color1,
          callback: function1,
        ),
        CalculatorButton(
          text: btn2,
          fillColor: color2,
          callback: function2,
        ),
        if (btn3 == '=')
          SizedBox(
            width: 65 * 2.5,
            child: CalculatorButton(
              text: btn3,
              fillColor: color4,
              callback: function3,
              textColor: colors['secondaryTextColor'],
            ),
          )
        else
          CalculatorButton(
            text: btn3,
            fillColor: color3,
            callback: function3,
            textColor: textColor,
          ),
        if (btn3 != '=')
          CalculatorButton(
            text: btn4,
            fillColor: color4,
            textColor: colors['secondaryTextColor'],
            callback: function4,
          ),
      ],
    );
  }

  Widget _buildWideRow(int index) {
    String btn1 = '', btn2 = '', btn3 = '', btn4 = '', btn5 = '';
    double buttonHeigth = 50.0;

    int? color1, color2, color3, color4;
    int? textColor;

    VoidCallback function1 = () {},
        function2 = () {},
        function3 = () {},
        function4 = () {},
        function5 = () {};

    Map<String, int> colors = {
      'mainColor': 0xFFfdff91, //accent
      'mainTextColor': 0xFF000000, //black
      'secondaryTextColor': 0xFFffffff, //white
      'functionsColor': 0xFFfbb92b, //yellow
      'operatorsColor': 0xFF8e28dc, //purple
    };

    if (index == 0) {
      //ASIGNACIÓN DE VALORES (ROW 1)
      btn2 = 'AC';
      btn3 = 'C';
      btn4 = '<';
      btn5 = '/';
      //ASIGNACIÓN DE COLORES (ROW 1)
      color1 = colors['functionsColor'];
      color2 = colors['functionsColor'];
      color3 = colors['operatorsColor'];
      color4 = colors['operatorsColor'];
      textColor = colors['secondaryTextColor'];
      //ASIGNACIÓN DE FUNCIONES
      function2 = () {
        setState(() {
          _firstNum = 0;
          _secondNum = 0;
          _history = '';
          _textToDisplay = '';
          _operation = '';
          print('All was cleared');
        });
      };
      function3 = () {
        setState(() {
          _firstNum = 0;
          _secondNum = 0;
          _textToDisplay = '';
          _operation = '';
          print('Last operation was cleared');
        });
      };
      function4 = () {
        setState(() {
          _textToDisplay = _calculatorBloc.eraser(_textToDisplay);
          print('Cleared last character');
        });
      };
      function5 = () {
        _assignOperation('/');
      };
    } else if (index == 1) {
      //ASIGNACIÓN DE VALORES (ROW 2)
      btn1 = '9';
      btn2 = '8';
      btn3 = '7';
      btn4 = '6';
      btn5 = 'X';
      //ASIGNACIÓN DE COLORES (ROW 2)
      color1 = colors['mainColor'];
      color2 = colors['mainColor'];
      color3 = colors['mainColor'];
      color4 = colors['operatorsColor'];
      //ASIGNACIÓN DE FUNCIONES (ROW 2)
      function1 = () {
        _assignNumber('9');
      };
      function2 = () {
        _assignNumber('8');
      };
      function3 = () {
        _assignNumber('7');
      };
      function4 = () {
        _assignNumber('6');
      };
      function5 = () {
        _assignOperation('X');
      };
    } else if (index == 2) {
      btn1 = '5';
      btn2 = '4';
      btn3 = '3';
      btn4 = '2';
      btn5 = '-';
      //ASIGNACIÓN DE COLORES (ROW 3)
      color1 = colors['mainColor'];
      color2 = colors['mainColor'];
      color3 = colors['mainColor'];
      color4 = colors['operatorsColor'];
      //ASIGNACIÓN DE FUNCIONES (ROW 3)
      function1 = () {
        _assignNumber('5');
      };
      function2 = () {
        _assignNumber('4');
      };
      function3 = () {
        _assignNumber('3');
      };
      function4 = () {
        _assignNumber('2');
      };
      function5 = () {
        _assignOperation('-');
      };
    } else if (index == 3) {
      btn1 = '1';
      btn2 = '0';
      btn3 = '00';
      btn4 = '=';
      btn5 = '+';
      //ASIGNACIÓN DE COLORES (ROW 4)
      color1 = colors['mainColor'];
      color2 = colors['mainColor'];
      color3 = colors['mainColor'];
      color4 = colors['operatorsColor'];
      //ASIGNACIÓN DE FUNCIONES (ROW 4)
      function1 = () {
        _assignNumber('1');
      };
      function2 = () {
        _assignNumber('0');
      };
      function3 = () {
        _assignNumber('00');
      };
      function4 = () {
        setState(() {
          _textToDisplay = _calculatorBloc.operate(
            _firstNum,
            _secondNum,
            _operation,
          );
          _firstNum = int.parse(_textToDisplay);
          _secondNum = 0;
          _operation = '';
          _history = _textToDisplay;
          print(_textToDisplay);
        });
      };
      function5 = () {
        _assignOperation('+');
      };
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        index == 0
            ? SizedBox(
                width: 80.0,
              )
            : CalculatorButton(
                text: btn1,
                fillColor: color1,
                callback: function1,
                buttonHeight: buttonHeigth,
              ),
        CalculatorButton(
          text: btn2,
          fillColor: color1,
          callback: function2,
          buttonHeight: buttonHeigth,
        ),
        CalculatorButton(
          text: btn3,
          fillColor: color2,
          callback: function3,
          buttonHeight: buttonHeigth,
        ),
        CalculatorButton(
          text: btn4,
          fillColor: btn4 == '<' || btn4 == '=' ? color4 : color1,
          callback: function4,
          buttonHeight: buttonHeigth,
          textColor: btn4 == '=' ? colors['secondaryTextColor'] : textColor,
        ),
        CalculatorButton(
          text: btn5,
          fillColor: color4,
          callback: function5,
          textColor: colors['secondaryTextColor'],
          buttonHeight: buttonHeigth,
        ),
      ],
    );
  }
}
