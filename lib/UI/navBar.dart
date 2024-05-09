import 'package:estibafy_company_app/UI/Notification/notificationScreen.dart';
import 'package:estibafy_company_app/UI/profile/profileScreen.dart';
import 'package:estibafy_company_app/UI/widgets/draawer.dart';
import 'package:estibafy_company_app/controllers/tabController.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Orders/orders_screen.dart';


class MainNav extends StatelessWidget {
   MainNav({Key? key}) : super(key: key);

  final tabController = Get.put(TabNavController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GNav(
            rippleColor: AppColors.primaryColor, // tab button ripple color when pressed
            hoverColor: AppColors.primaryColor, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            backgroundColor: AppColors.backgroundColor.withOpacity(0.3),
            tabActiveBorder: Border.all(color: Colors.white, width: 1), // tab button border
            tabBorder: Border.all(color: Colors.white, width: 1), // tab button border
            curve: Curves.linear, // tab animation curves
            duration: const Duration(milliseconds: 300), // tab animation duration
            gap: 10, // the tab button gap between icon and text
            color: Colors.grey, // unselected icon color
            activeColor: AppColors.backgroundColor, // selected icon and text color
            iconSize: 30, // tab button icon size
            tabBackgroundColor: AppColors.primaryColor, // selected tab background color
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // navigation bar padding
            onTabChange: (index){
              tabController.tabNavBarIndex.value = index;
            },

            tabs: const[
              GButton(
                icon: Icons.home_outlined,
                text: 'Dashboard',
                textSize: 18,
              ),
              GButton(
                icon: Icons.workspaces_outlined,
                text: 'Jobs',
                textSize: 18,
              ),
              GButton(
                icon: Icons.notifications_active_outlined,
                text: 'Notification',
                textSize: 18,
              ),
              GButton(
                icon: Icons.person_outline_sharp,
                text: 'Profile',
                textSize: 18,
              )
            ]
        ),
      ),
      body: Obx(
          ()=> tabController.tabNavBarIndex.value == 0
              ? ZoomDraawer()
              : tabController.tabNavBarIndex.value == 1
              ? Jobs()
              : tabController.tabNavBarIndex.value == 2
              ? NotificationScreen()
              : ProfileScreen()
      ),
    );
  }
}
