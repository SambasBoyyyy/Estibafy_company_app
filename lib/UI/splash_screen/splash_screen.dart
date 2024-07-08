import 'dart:async';

import 'package:estibafy_company_app/UI/auth/loginScreen.dart';
import 'package:estibafy_company_app/UI/dashboard/dashboard.dart';
import 'package:estibafy_company_app/UI/navBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.isNewUser});

  final bool isNewUser;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();

    Timer(const Duration(seconds: 3), () {
      if (widget.isNewUser) {
        // Get.to(LoginScreen());
        Get.to(() => LoginScreen());
      } else {
        // Get.to(MainNav());
        Get.to(() => MainNav());
      }

    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: FlutterLogo(
            size: 200.0,
          ),
        ),
      ),
    );
  }
}
