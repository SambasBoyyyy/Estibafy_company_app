import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

Widget backButton() {
  return Align(
    alignment: Alignment.centerLeft,
    child: InkWell(
      onTap: () {
        Get.back();
      },
      child: const Padding(
          padding: EdgeInsets.all(12.0), child: Icon(LineAwesomeIcons.alternate_long_arrow_left,)),
    ),
  );
}
