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
      textToDisplay = operation;
    } else if (btnVal == 'AC') {
      firstNum = 0;
      secondNum = 0;
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
        textToDisplay = firstNum.toString();
      } else {
        secondNum = int.parse(btnVal);
        textToDisplay = btnVal;
      }
    }
    return textToDisplay;
  }

  String eraser(String text) {
    return text.substring(0, text.length - 1);
  }
}
