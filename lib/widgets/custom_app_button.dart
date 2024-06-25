import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function buttonTapped;

  const CustomAppButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buttonTapped(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
