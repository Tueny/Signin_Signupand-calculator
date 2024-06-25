import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController {
  var userInput = '';
  var userOutput = '';

  void clearInputAndOutput() {
    userInput = '';
    userOutput = '';
    update();
  }

  void deleteBtnAction() {
    if (userInput.isNotEmpty) {
      userInput = userInput.substring(0, userInput.length - 1);
      update();
    }
  }

  void equalPressed() {
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userOutput = eval.toString();
    update();
  }

  void onBtnTapped(String buttonText) {
    if (buttonText == 'ANS') {
      userInput += userOutput;
    } else {
      userInput += buttonText;
    }
    update();
  }
}
