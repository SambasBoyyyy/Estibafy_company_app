import 'package:estibafy_company_app/UI/helpers/assign_helpers_sheet.dart';
import 'package:estibafy_company_app/UI/widgets/Orders%20Widgets/job_detail_widget.dart';
import 'package:estibafy_company_app/UI/widgets/Orders%20Widgets/job_helper_widget.dart';
import 'package:estibafy_company_app/UI/widgets/Orders%20Widgets/order_detail_customer_widget.dart';
import 'package:estibafy_company_app/UI/widgets/backButton.dart';
import 'package:estibafy_company_app/components/components.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/company_jobs_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, this.jobData});

  final JobData? jobData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                backButton(),
                const Spacer(),
                Text(
                  "Order Details",
                  style: titleTextStyle,
                ),
                const Spacer(),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Order ID #${jobData?.id ?? "--"}",
                  style: simpleTextStyle.copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomerWidget(
              job: jobData,
            ),
            JobDetailsWidget(
              job: jobData,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text("Job Helpers", style: nameTextStyle.copyWith(fontSize: 16)),
                Spacer(),
                Text(
                    '${jobData?.job?.jobHelpers?.length ?? "0"}/${jobData?.totalHelpers?.toString() ?? "0"}'),
                Spacer(),
                MaterialButton(
                  height: 30,
                  minWidth: 20,
                  color: AppColors.primaryColor,
                  onPressed: () {
                    Get.to(AssignHelperScreen(
                      totalHelper: jobData?.totalHelpers ?? 0,
                      jobId: jobData?.jobId ?? 0,
                    ));
                  },
                  child: const Text(
                    "+ Add",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            jobData != null
                ? jobData!.job!.jobHelpers!.isEmpty
                    ? Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(AssignHelperScreen(
                                totalHelper: jobData?.totalHelpers ?? 0,
                                jobId: jobData?.jobId ?? 0,
                              ));
                            },
                            child: Container(
                              width: 100,
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(color: AppColors.primaryColor),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Helpers",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "Please Add Helper \nFor Starting the Job",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: jobData!.job!.jobHelpers?.length ?? 0,
                        itemBuilder: (context, index) {
                          return JobHelperWidget(
                              helper: jobData!.job!.jobHelpers?[index] ?? JobHelper());
                        })
                : const Center(child: Text("Please Add Helper For Starting\n the Job")),
          ],
        ),
      ),
    ));
  }
}
