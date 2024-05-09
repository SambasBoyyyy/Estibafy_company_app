import 'package:estibafy_company_app/components/components.dart';
import 'package:estibafy_company_app/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../theme/colors.dart';

class DashboardJobCard extends StatelessWidget {
  const DashboardJobCard({
    super.key,
    required this.customerName,
    required this.customerAddress,
    required this.jobAmount,
    required this.totalHelpers,
    required this.date,
    required this.jobId,
    required this.reference,
  });

  final String customerName;
  final String customerAddress;
  final String jobAmount;
  final String totalHelpers;
  final String date;
  final int jobId;
  final String reference;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 1, color: AppColors.primaryColor)),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerName,
                  style: simpleTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  customerAddress,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  style: simpleTextStyle.copyWith(fontSize: 15, color: AppColors.greyColor),
                ),
              ],
            ),
            const Divider(
              color: AppColors.primaryColor,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          LineAwesomeIcons.dollar_sign,
                          size: 20,
                        ),
                        Text(
                          jobAmount,
                          style: simpleTextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 50,
                      height: 1,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Icon(LineAwesomeIcons.helping_hands),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          totalHelpers,
                          style: simpleTextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.redColor,
                  child: Icon(
                    LineAwesomeIcons.times,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    final orderController = Get.put(OrderController());
                    orderController.acceptJob(
                      jobId: jobId,
                      path: reference,
                    );
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.greenColor,
                    child: Icon(
                      LineAwesomeIcons.check,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
