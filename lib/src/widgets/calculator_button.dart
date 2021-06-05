import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int? fillColor;
  final int? textColor;
  final double? textSize;
  final Function callback;

  CalculatorButton({
    required this.text,
    this.fillColor,
    this.textColor,
    this.textSize,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 65,
        height: 65,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(fillColor!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              fontSize: textSize,
              color: Color(textColor!),
            ),
          ),
          onPressed: () {
            callback(text);
          },
        ),
      ),
    );
  }
}
