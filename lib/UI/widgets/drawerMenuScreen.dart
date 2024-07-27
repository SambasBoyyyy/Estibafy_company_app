import 'package:estibafy_company_app/UI/helpers/all_helpers.dart';
import 'package:estibafy_company_app/UI/terms_conditions.dart';
import 'package:estibafy_company_app/UI/widgets/draawer.dart';
import 'package:estibafy_company_app/UI/widgets/drawerMenuChildWidget.dart';
import 'package:estibafy_company_app/controllers/helper_controller.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../helpers/register_helper.dart';



class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.64,
            child: Column(
              children: [
                // DrawerWidget(title: "Orders", iconData: LineAwesomeIcons.tasks, onPress: (){
                // },),
                // const Divider(color: AppColors.primaryColor,),
                DrawerWidget(title: "Register Helper", iconData: LineAwesomeIcons.user_plus, onPress: (){
                  Get.to( RegisterHelpers());
                },),
                const Divider(color: AppColors.primaryColor,),
                DrawerWidget(title: "All Helpers", iconData: LineAwesomeIcons.user_friends, onPress: (){
                  final helperController = Get.put(HelperController());
                  helperController.getAllHelpers();
                  Get.to( AllHelpersScreen());
                },),
                // const Divider(color: AppColors.primaryColor,),
                // DrawerWidget(title: "Payments", iconData: LineAwesomeIcons.wallet, onPress: (){},),
                const Divider(color: AppColors.primaryColor,),
                // DrawerWidget(title: "Settings", iconData: LineAwesomeIcons.cog, onPress: (){},),
                // const Divider(color: AppColors.primaryColor,),
                DrawerWidget(title: "Terms & Policies", iconData: LineAwesomeIcons.readme, onPress: (){
                  Get.to(TermsAndConditions());
                },),
                const Divider(color: AppColors.primaryColor,),
                // DrawerWidget(title: "About Us", iconData: LineAwesomeIcons.info, onPress: (){},),
                // const Divider(color: AppColors.primaryColor,),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: (){
                    drawerController.close!();
                  },
                  child: const CircleAvatar(backgroundColor: AppColors.primaryColor,
                  child: Icon(LineAwesomeIcons.times),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
