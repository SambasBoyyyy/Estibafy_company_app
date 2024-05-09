import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';

final titleTextStyle = GoogleFonts.robotoCondensed(
  textStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 35,
    color: AppColors.primaryColor,
  ),
);

final subtitleTextStyle = GoogleFonts.robotoCondensed(
  textStyle: const TextStyle(
    fontSize: 18,
    color: AppColors.greyColor,
  ),
);

final buttonTextStyle = GoogleFonts.robotoCondensed(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 22,
    color: AppColors.backgroundColor,
  ),
);

final simpleTextStyle = GoogleFonts.robotoCondensed(
  textStyle: const TextStyle(
    fontSize: 16,
    color: AppColors.blackColor,
  ),
);

final nameTextStyle = GoogleFonts.robotoCondensed(
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: AppColors.blackColor,
  ),
);

final normalTextStyle = GoogleFonts.robotoCondensed(
  textStyle: const TextStyle(
    fontSize: 12,
    color: AppColors.blackColor,
  ),
);