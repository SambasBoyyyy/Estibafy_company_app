import 'package:estibafy_company_app/components/components.dart';
import 'package:flutter/material.dart';


import '../../models/company_helpers.dart';
import '../../theme/colors.dart';


class DashboardHelperWidget extends StatelessWidget {
  const DashboardHelperWidget({super.key, required this.helper});

  final Helper helper;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(12.0)
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(helper.name ?? "--", style: subtitleTextStyle.copyWith(
                    fontSize: 16,
                    color: Colors.black
                  ),),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(helper.streetAddress ?? "--", style: subtitleTextStyle.copyWith(
                      fontSize: 14,
                    color: AppColors.greyColor
                  ),)
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 8.0,
                backgroundColor: AppColors.greenColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
