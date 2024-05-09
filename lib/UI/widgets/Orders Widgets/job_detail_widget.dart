import 'package:estibafy_company_app/components/components.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../models/company_jobs_model.dart';
import '../date_month.dart';

class JobDetailsWidget extends StatelessWidget {
  const JobDetailsWidget({super.key, this.job});

  final JobData? job;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const SizedBox(
            height: 10.0,
          ),
         Text("Order Details".toUpperCase(), style: normalTextStyle.copyWith(
           fontSize: 18.0
         ),),
         const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              const Spacer(),
              Column(
                children: [
                  Text(job?.job?.startTime?.day.toString() ?? "0", style: simpleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),),
                  Text(getMonthString(job?.job?.startTime?.month ?? 0), style: simpleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),),
                  Text("${job?.job?.startTime?.year ?? 0}", style: simpleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),),
                ],
              ),
              Spacer(),
              Container(
                width: 1,
                height: 70,
                color: AppColors.primaryColor,
              ),
              Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Start Time:", style: normalTextStyle.copyWith(
                          fontSize: 16.0
                      ),),
                      const SizedBox(width: 10.0,),
                      Text("${job?.job?.startTime?.hour ?? 0} : ${job?.job?.startTime?.minute ?? 0} ", style: normalTextStyle.copyWith(
                          fontSize: 16.0,
                        fontWeight: FontWeight.w700
                      ),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150,
                      height: 1,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      Text("End Time:", style: normalTextStyle.copyWith(
                          fontSize: 16.0
                      ),),
                      SizedBox(width: 10.0,),
                      Text("${job?.job?.endTime?.hour ?? 0} : ${job?.job?.endTime?.minute ?? 0} ", style: normalTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700
                      ),),
                    ],
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.0, color: AppColors.primaryColor)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(LineAwesomeIcons.box, size: 30,),
                  Text(job?.job?.container?.name ?? "--", style: simpleTextStyle.copyWith(
                    fontSize: 18,
                  ),),
                  Spacer(),
                  const Icon(LineAwesomeIcons.truck_loading,size: 30,),
                  const SizedBox(width: 5.0,),
                  Text(job?.job?.packageType ?? "--", style: simpleTextStyle.copyWith(
                    fontSize: 18,
                  ),),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 25,),
              Text(
                job?.job?.address ?? "--",
                style: normalTextStyle.copyWith(
                    fontSize: 18
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          Container(
            width: double.maxFinite,
            height: .5,
            color: AppColors.primaryColor,
          ),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Text(
                "Helpers",
                style: normalTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                ),
              ),
              const Spacer(),
              Text(
                job?.totalHelpers?.toString() ?? "--",
                style: normalTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                ),
              ),
              const Spacer(),
              Container(
                width: 1.2,
                height: 20,
                color: AppColors.primaryColor,
              ),
              const Spacer(),
              Text(
                "Total",
                style: normalTextStyle.copyWith(
                    fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
              const Spacer(),
              Text(
                '\$${job?.total ?? "--"}',
                style: normalTextStyle.copyWith(
                    fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          Container(
            width: double.maxFinite,
            height: .5,
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }

  String getMonth(int month) {
    if (month == 01) {
      return 'January';
    } else if (month == 02) {
      return 'February';
    } else if (month == 03) {
      return 'March';
    } else if (month == 04) {
      return 'April';
    } else if (month == 05) {
      return 'May';
    } else if (month == 06) {
      return 'June';
    } else if (month == 07) {
      return 'July';
    } else if (month == 08) {
      return 'August';
    } else if (month == 09) {
      return 'September';
    } else if (month == 10) {
      return 'October';
    } else if (month == 11) {
      return 'November';
    } else {
      return 'December';
    }
  }
}
