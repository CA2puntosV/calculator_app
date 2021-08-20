import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int? fillColor;
  final int? textColor;
  final double? textSize;
  final double? buttonHeight;
  final VoidCallback callback;

  CalculatorButton({
    required this.text,
    this.fillColor,
    this.textColor,
    this.textSize,
    this.buttonHeight,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8.0,
        left: 5.0,
        bottom: 5.0,
        right: 5.0,
      ),
      child: SizedBox(
        width: 75,
        height: buttonHeight ?? 75,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(fillColor!),
            shadowColor: Colors.black,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              fontSize: textSize ?? 22.0,
              color: Color(textColor ?? 0xFF000000),
            ),
          ),
          onPressed: this.callback,
        ),
      ),
    );
  }
}
