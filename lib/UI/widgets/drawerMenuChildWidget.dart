import 'package:estibafy_company_app/components/components.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.title, required this.iconData, required this.onPress});

  final String title;
  final IconData iconData;
  final Function() onPress;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(iconData, color: AppColors.primaryColor, size: 30,),
            const SizedBox(
              width: 20.0,
            ),
            Text(title, style: titleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.blackColor
            ),),
            const Spacer(),
            const Icon(LineAwesomeIcons.angle_right)
          ],
        ),
      ),
    );
  }
}
