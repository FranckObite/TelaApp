import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFont {
  static TextStyle googleFonts = GoogleFonts.sora();

  static TextStyle font() {
    return googleFonts;
  }

  static TextStyle appBarTextStyle() {
    return googleFonts.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500);
  }

  static TextStyle menuTextStyle() {
    return googleFonts.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500);
  }

  static TextStyle buttonTextStyle() {
    return googleFonts.copyWith(color: Colors.white, fontSize: 18.sp);
  }
}
