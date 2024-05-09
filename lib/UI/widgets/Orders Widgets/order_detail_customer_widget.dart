import 'package:flutter/material.dart';
import '../../../components/components.dart';

import '../../../models/company_jobs_model.dart';
import '../../../theme/colors.dart';


class CustomerWidget extends StatelessWidget {
  const CustomerWidget({super.key, this.job});

  final JobData? job;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(job?.job?.user?.name ?? "--", style: nameTextStyle.copyWith(
                    fontSize: 16
                  )),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email,size: 20,),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        job?.job?.user?.email ?? "--",
                        style: normalTextStyle.copyWith(
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.call,size: 20,),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        job?.job?.user?.mobile ?? "--",
                        style: normalTextStyle.copyWith(
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                ],
              ),
            ],
          ),
          const Divider(color: AppColors.primaryColor),
        ],
      ),
    );
  }
}
