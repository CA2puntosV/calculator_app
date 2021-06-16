class CalculatorBloc {
  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textToDisplay = '';
  String operation = '';

  String operate(int firstNumber, int secondNumber, String operation) {
    String result;
    switch (operation) {
      case '+':
        result = (firstNumber + secondNumber).toString();
        break;
      case '-':
        result = (firstNumber - secondNumber).toString();
        break;
      case 'X':
        result = (firstNumber * secondNumber).toString();
        break;
      case '/':
        result = (firstNumber ~/ secondNumber).toString();
        break;
      default:
        result = "Error D:";
    }
    return result;
  }

  String btnOnClick(String btnVal) {
    if (btnVal == '+' || btnVal == '-' || btnVal == 'X' || btnVal == '/') {
      operation = btnVal;
      textToDisplay = textToDisplay + btnVal;
    } else {
      if (btnVal == '=') {
        textToDisplay = operate(firstNum, secondNum, operation);
        firstNum = 0;
        secondNum = 0;
        operation = '';
      } else if (btnVal == 'AC') {
        firstNum = 0;
        secondNum = 0;
        history = '';
        textToDisplay = '';
        operation = '';
      } else if (btnVal == 'C') {
        firstNum = 0;
        secondNum = 0;
        textToDisplay = '';
        operation = '';
      } else {
        if (operation.isEmpty) {
          firstNum = int.parse(btnVal);
          textToDisplay = textToDisplay + firstNum.toString();
        } else {
          secondNum = int.parse(btnVal);
          textToDisplay = textToDisplay + secondNum.toString();
        }
      }
    }
    return textToDisplay;
  }

  String eraser(String text) {
    print('Cleared last number');
    return text.substring(0, text.length - 1);
  }
}

// void allClear({
//   required String history,
//   required String textToDisplay,
// }) {
//   print('Everything was cleared');
//   history = '';
//   textToDisplay = '';
// }

// String clear(String text) {
//   print('Cleared last operation');
//   return text = 'na';
// }
