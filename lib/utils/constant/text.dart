import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const NormalText(
      {Key? key, required this.text, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.poppins(fontSize: size, color: color));
  }
}

class BoldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const BoldText(
      {Key? key, required this.text, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            fontSize: size, color: color, fontWeight: FontWeight.bold));
  }
}

class WeighText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const WeighText({Key? key, required this.text,required this.size, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,style: GoogleFonts.poppins(fontSize: size,color: color, fontWeight: FontWeight.w700)
    );
  }
}

class SemiWeighText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const SemiWeighText({Key? key, required this.text,required this.size, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,style: GoogleFonts.poppins(fontSize: size,color: color, fontWeight: FontWeight.w500)
    );
  }
}


