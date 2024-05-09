import 'package:estibafy_company_app/components/components.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../models/company_helpers.dart';

class HelperWidget extends StatelessWidget {
  const HelperWidget({super.key, required this.helper});

  final Helper helper;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 1),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(helper.name ?? "--", style: nameTextStyle),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "${helper.email} | ${helper.mobile}",
                          style: normalTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 15,),
                        Text(
                          "${helper.city}, ${helper.province}, ${helper.country}",
                          style: normalTextStyle.copyWith(
                            color: AppColors.greyColor
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(LineAwesomeIcons.alternate_arrow_circle_right_1),
              ],
            ),
            const Divider(color: AppColors.primaryColor),
            Row(
              children: [
                const Icon(LineAwesomeIcons.briefcase),
                Text("Total Jobs: ", style: normalTextStyle.copyWith(
                  fontSize: 14
                )),
                const Spacer(),
                const Icon(LineAwesomeIcons.dollar_sign),
                Text("Earnings: 98594", style: normalTextStyle.copyWith(
                    fontSize: 14
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
