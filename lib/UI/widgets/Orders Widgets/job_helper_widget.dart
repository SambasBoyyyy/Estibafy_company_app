import 'package:estibafy_company_app/components/components.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../models/company_jobs_model.dart';

class JobHelperWidget extends StatelessWidget {
  const JobHelperWidget({super.key, required this.helper});

  final JobHelper? helper;

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
                    Text(helper?.helperProfile?.name ?? "--",
                        style: nameTextStyle.copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "${helper?.helperProfile?.email}",
                          style: normalTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                          size: 12,
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "${helper?.helperProfile?.mobile}",
                          style: normalTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
