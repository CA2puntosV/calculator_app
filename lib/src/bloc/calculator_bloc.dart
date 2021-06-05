class CalculatorBloc {
  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textToDisplay = '';
  String res = '';
  String operation = '';

  String btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == '+' || btnVal == '-' || btnVal == 'X' || btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      res = '0';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    return res;
  }

  void allClear({
    required String history,
    required String textToDisplay,
  }) {
    history = '';
    textToDisplay = '';
  }

  void clear(String text) {
    text = '';
  }

  String eraser(String text) {
    return text.substring(0, text.length - 1);
  }
}
