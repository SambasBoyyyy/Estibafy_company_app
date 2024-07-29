import 'package:estibafy_company_app/UI/helpers/all_helpers.dart';
import 'package:estibafy_company_app/UI/profile/updateProfileScreen.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/tabController.dart';
import '../helpers/helper_rate.dart';
import '../widgets/profileTileWidget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CircleAvatar(
                      child: Image.network(
                        'https://i.pinimg.com/originals/be/c8/8c/bec88c0d89bca09ce2537257ee3fd054.jpg',
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              Obx(() => Text(authController.userProfile.value.data?.user?.company?.companyName ?? "--",
                  style: Theme.of(context).textTheme.headline4)),
              Text("A company that leading helpers", style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    authController.companyName.text =
                        authController.userProfile.value.data?.user?.company?.companyName ?? "--";
                    authController.companyContact.text =
                        authController.userProfile.value.data?.user?.mobile ?? "--";
                    authController.companyAddress.text =
                        authController.userProfile.value.data?.user?.company?.companyAddress ?? "--";
                    authController.rucOfCompany.text = authController.userProfile.value.data?.user?.company?.ruc ?? "--";
                    authController.nameControllerSignup.text =
                        authController.userProfile.value.data?.user?.name ?? "--";
                    authController.emailControllerSignup.text =
                        authController.userProfile.value.data?.user?.email ?? "--";
                    authController.contactControllerSignup.text =
                        authController.userProfile.value.data?.user?.mobile ?? "--";
                    Get.to(()=> UpdateProfileScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("Edit Profile",
                      style: TextStyle(color: AppColors.backgroundColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              //ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
              // ProfileMenuWidget(
              //     title: "Payments Details", icon: LineAwesomeIcons.wallet, onPress: () {}),

              ProfileMenuWidget(
                  title: "Set Helper Rate", icon: LineAwesomeIcons.money_check, onPress: () {
                Get.to(()=> const HelperRate());
              }),
              ProfileMenuWidget(
                  title: "Helper Management", icon: LineAwesomeIcons.user_check, onPress: () {
                Get.to(()=> AllHelpersScreen());
              }),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final tabController = Get.put(TabNavController());
                            tabController.tabNavBarIndex.value = 0;
                            authController.onSignOut();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent, side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
