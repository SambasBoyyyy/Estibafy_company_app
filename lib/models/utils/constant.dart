import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xff002E5D);
const secondaryColor = Color(0xFFFFFFFF);
const tertiaryColor = Color(0xff1B6ABA);
const fourthColor = Color(0xff000000);
const fifthColor = Color(0xff05D434);
const sixthColor = Color(0xff707070);
const seventhColor = Color(0xffF28608);
const eighthColor = Color(0xffE61C1C);
const ninthColor = Color(0xffFF0707);
const tenthColor = Color(0xff989898);
const eleventhColor = Color(0xffE21616);
const twelveColor = Color(0xff13BCFA);
const thirteenColor = Color(0xff4CA831);
const fourteenColor = Color(0xffA7A7A7);

var titleTextStyleConst = GoogleFonts.sourceSans3(
  fontSize: 50.0,
  color: primaryColor,
  wordSpacing: 0.5,
  letterSpacing: 0.5,
);

var textStyle1 = GoogleFonts.sourceSans3(
  fontSize: 20.0,
  color: fourthColor,
  fontWeight: FontWeight.w500,
  wordSpacing: 0.5,
  letterSpacing: 0.5,
);
var textStyle2 = GoogleFonts.sourceSans3(
  fontSize: 13.0,
  color: fourthColor,
  wordSpacing: 0.5,
  letterSpacing: 0.5,
);
var textStyle3 = GoogleFonts.sourceSans3(
  fontSize: 15.0,
  color: fourthColor,
  wordSpacing: 0.4,
  letterSpacing: 0.2,
);
var textStyle4 = GoogleFonts.sourceSans3(
  fontSize: 13.0,
  color: secondaryColor,
  height: 2,
  wordSpacing: 0.4,
  letterSpacing: 0.2,
);
var textStyle5 = GoogleFonts.sourceSans3(
  fontSize: 12.0,
  color: fourthColor,
  wordSpacing: 0.5,
  letterSpacing: 0.5,
);

var textStyle6 = GoogleFonts.robotoCondensed(
  fontSize: 30.0,
  color: fifthColor,
  fontWeight: FontWeight.w900,
  wordSpacing: 0.5,
  letterSpacing: 0.5,
);

class K {


  static void showToast({required String message, Toast? toastLength}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
    );
  }

  static SnackBar customSnackBar({
    required Widget child,
  }) {
    return SnackBar(
      content: child,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(label: 'OK', onPressed: () {}),
    );
  }
}
