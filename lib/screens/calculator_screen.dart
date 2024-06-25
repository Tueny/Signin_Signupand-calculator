import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculate_controller.dart';
import '../controllers/theme_controller.dart';
import '../widgets/custom_app_button.dart';
import '../styles/dark_colors.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  final List<String> buttons = [
    "C", "DEL", "%", "/",
    "9", "8", "7", "x",
    "6", "5", "4", "-",
    "3", "2", "1", "+",
    "0", ".", "ANS", "=",
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CalculateController());

    return Scaffold(
      backgroundColor: DarkColors.scaffoldBgColor,
      body: Column(
        children: [
          GetBuilder<CalculateController>(builder: (context) {
            return outPutSection(controller);
          }),
          inPutSection(controller),
        ],
      ),
    );
  }

  Widget inPutSection(CalculateController controller) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: DarkColors.sheetBgColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double buttonHeight = constraints.maxHeight / 5;
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: buttonHeight,
                  child: CustomAppButton(
                    buttonTapped: () {
                      if (index == 0) {
                        controller.clearInputAndOutput();
                      } else if (index == 1) {
                        controller.deleteBtnAction();
                      } else if (index == 19) {
                        controller.equalPressed();
                      } else {
                        controller.onBtnTapped(buttons[index]);
                      }
                    },
                    color: isOperator(buttons[index])
                        ? DarkColors.operatorColor
                        : DarkColors.btnBgColor,
                    textColor: Colors.white,
                    text: buttons[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget outPutSection(CalculateController controller) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              controller.userInput,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            Text(
              controller.userOutput,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String y) {
    return ["%", "/", "x", "-", "+", "="].contains(y);
  }
}
