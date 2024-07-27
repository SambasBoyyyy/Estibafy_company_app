import 'package:estibafy_company_app/UI/widgets/backButton.dart';
import 'package:estibafy_company_app/controllers/helper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../models/company_helpers.dart';
import '../../theme/colors.dart';
import '../widgets/show_message.dart';

class AssignHelperScreen extends StatefulWidget {
   AssignHelperScreen({super.key, this.totalHelper, this.jobId});

  final int? totalHelper;
  final int? jobId;

  @override
  State<AssignHelperScreen> createState() => _AssignHelperScreenState();
}

class _AssignHelperScreenState extends State<AssignHelperScreen> {
  final helperController = Get.put(HelperController());

  @override
  void initState() {
    helperController.assignHelpers.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600,
        width: Get.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            )),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(12.0),
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Row(
                  children: [
                    backButton(),
                    Spacer(),
                    const Text(
                      "Select Helpers",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          if(helperController.assignHelpers.isNotEmpty){
                            helperController.assignHelper(jobId: widget.jobId);
                          }
                          else{
                            ShowMessage().showMessage("Please Assign Helpers");
                          }
                        },
                        child: Icon(Icons.done_outline)),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: 40,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor
                ),
                child: Center(
                  child: Obx(
                        ()=>  Text("${helperController.assignHelpers.length}/${widget.totalHelper}",style: TextStyle(
                        fontSize: 20,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Obx(
                    () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: helperController.helpers.value.data?.length ?? 1,
                    itemBuilder: (context, index) {
                      if (helperController.helpers.value.data == null) {
                        return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ));
                      } else {
                        return HelperCard(
                          helper: helperController.helpers.value.data?[index] ?? Helper(),
                          totalHelper: widget.totalHelper!,
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelperCard extends StatefulWidget {
  HelperCard({super.key, required this.helper, required this.totalHelper});

  final Helper helper;
  final int totalHelper;

  @override
  State<HelperCard> createState() => _HelperCardState();
}

class _HelperCardState extends State<HelperCard> {
  final helperController = Get.put(HelperController());
  bool checkValue = false;
  TextEditingController numberController = TextEditingController();

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  void _handleCheckboxChanged(bool? value) {
    if (value == true && helperController.assignHelpers.length >= widget.totalHelper) {
      // Show a message when the limit is exceeded
      ShowMessage().showErrorMessage("Cannot select more than ${widget.totalHelper} helpers");
      return;
    }

    setState(() {
      checkValue = value!;
    });

    if (!checkValue) {
      helperController.removeHelper(widget.helper);
    } else {
      helperController.addHelper(widget.helper);
    }
  }

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
                    Text(widget.helper.name ?? "--", style: nameTextStyle),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "${widget.helper.email}\n${widget.helper.mobile}",
                      style: normalTextStyle,
                    ),
                  ],
                ),
                const Spacer(),
                Checkbox(
                  value: checkValue,
                  onChanged: _handleCheckboxChanged,
                ),
              ],
            ),
            // if (checkValue)
            //   Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 8.0),
            //     child: TextFormField(
            //       controller: numberController,
            //       decoration: InputDecoration(
            //         labelText: 'Enter Payment',
            //         border: OutlineInputBorder(),
            //       ),
            //       keyboardType: TextInputType.number,
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
