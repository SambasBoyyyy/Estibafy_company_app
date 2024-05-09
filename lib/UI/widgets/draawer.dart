import 'package:estibafy_company_app/UI/dashboard/dashboard.dart';
import 'package:estibafy_company_app/UI/widgets/drawerMenuScreen.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


final drawerController = ZoomDrawerController();

class ZoomDraawer extends StatefulWidget {
  const ZoomDraawer({super.key});

  @override
  State<ZoomDraawer> createState() => _ZoomDraawerState();
}

class _ZoomDraawerState extends State<ZoomDraawer> {

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: drawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: const DrawerMenu(),
      mainScreen: Dashboard(),
      borderRadius: 24.0,
      showShadow: true,
      angle: -15.0,
      drawerShadowsBackgroundColor: AppColors.backgroundColor,
      menuBackgroundColor: AppColors.backgroundColor,
      mainScreenOverlayColor: AppColors.primaryColor,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }
}
