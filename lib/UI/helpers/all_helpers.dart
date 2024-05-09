import 'package:estibafy_company_app/UI/helpers/helper_details_screen.dart';
import 'package:estibafy_company_app/UI/widgets/helper_widget.dart';
import 'package:estibafy_company_app/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/helper_controller.dart';
import '../../models/company_helpers.dart';
import '../../theme/colors.dart';
import '../widgets/Orders Widgets/empty_message.dart';
import '../widgets/backButton.dart';

class AllHelpersScreen extends StatefulWidget {
  AllHelpersScreen({super.key});

  @override
  State<AllHelpersScreen> createState() => _AllHelpersScreenState();
}

class _AllHelpersScreenState extends State<AllHelpersScreen> {
  final helperController = Get.put(HelperController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helperController.getAllHelpers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  backButton(),
                  const Spacer(),
                  Text("All Helpers", style: titleTextStyle,),
                  const Spacer(),
                  const SizedBox(width: 20,),
                ],
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: Obx(
                    ()=> helperController.helpers.value.data != null ?

                    helperController.helpers.value.data!.isNotEmpty ? ListView.builder(
                      itemCount: helperController.helpers.value.data?.length ?? 1,
                      itemBuilder: (context, index) {
                        if (helperController.helpers.value.data == null) {
                          return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
                        } else {
                          return InkWell(
                            onTap: (){
                              Get.to(HelperDetailsScreen(helper: helperController.helpers.value.data?[index] ?? Helper()));
                            },
                            child: HelperWidget(
                              helper: helperController.helpers.value.data?[index] ?? Helper(),
                            ),
                          );
                        }
                      }) : const EmptyMessage()
                        : CircularProgressIndicator(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
