import 'package:estibafy_company_app/UI/widgets/date_month.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../components/components.dart';
import '../../../models/company_jobs_model.dart';
import '../../../theme/colors.dart';
import '../../Orders/order_detail_screen.dart';

class JobCardWidget extends StatelessWidget {
  const JobCardWidget({super.key, required this.job, this.jobStatus});

  final JobData job;
  final String? jobStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: () {
          Get.to(OrderDetailsScreen(
            jobData: job,
            jobStatus: jobStatus
          ));
        },
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
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.job?.user?.name ?? "--",
                        style: simpleTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        job.job?.address ?? "--",
                        style: simpleTextStyle.copyWith(fontSize: 11, color: AppColors.greyColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const Spacer(flex: 2,),
                  Text(
                    "${job.job?.id ?? 0}",
                    style: simpleTextStyle,
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.71,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    "see details",
                    style: normalTextStyle.copyWith(fontSize: 9),
                  ),
                  Icon(LineAwesomeIcons.arrow_right)
                ],
              ),
              const SizedBox(
                height: 10.0,
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
                            job.total ?? "--",
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
                            "${job.totalHelpers ?? 0}",
                            style: simpleTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    children: [
                      Text(
                        job.job?.startTime?.day.toString() ?? "--",
                        style: simpleTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        getMonthString(job.job!.startTime!.month),
                        style: simpleTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        job.job?.startTime?.year.toString() ?? "--",
                        style: simpleTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            LineAwesomeIcons.box,
                            size: 20,
                          ),
                          Text(
                            job.job?.container?.name ?? "--",
                            style: simpleTextStyle.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 80,
                        height: 1,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          const Icon(LineAwesomeIcons.drum_steelpan),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            job.job?.packageType ?? "--",
                            style: simpleTextStyle.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  jobStatus == "in-process"
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.greyColor),
                          child: Column(
                            children: [
                              Text(
                                "Processing",
                                style: simpleTextStyle.copyWith(color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                        )
                      : jobStatus == "accepted"
                          ? Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.primaryColor),
                              child: Text(
                                "Start",
                                style: simpleTextStyle.copyWith(color: AppColors.whiteColor),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.greenColor),
                              child: Text(
                                "Completed",
                                style: simpleTextStyle.copyWith(color: AppColors.whiteColor),
                              ),
                            )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
