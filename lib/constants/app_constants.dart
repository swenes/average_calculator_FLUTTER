import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const anaRenk = Colors.indigo;

  static const String title = "Ortalama Hesapla";

  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle normalStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);

  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: anaRenk);

  static const EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 0);

  static const EdgeInsets yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
