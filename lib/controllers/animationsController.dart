import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Animate extends GetxController with GetTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   startAnimation();
  // }
  //
  // @override
  // // TODO: implement onStart
  // InternalFinalCallback<void> get onStart {
  //   controller1.reset();
  //   controller.reset();
  //   controller2.reset();
  //   startAnimation();
  //   return super.onStart;
  // }

  late AnimationController controller1 = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late AnimationController controller2 = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late Rx<Animation<Offset>> slideFromTop;
  late Rx<Animation<Offset>> slideFromBottom;
  late Rx<Animation<Offset>> slideFromRight;

  void startAnimation() {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    controller1 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    controller2 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    slideFromTop = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    )
        .animate(CurvedAnimation(
          parent: controller,
          curve: Curves.easeOut,
        ))
        .obs;
    slideFromBottom = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    )
        .animate(CurvedAnimation(
          parent: controller1,
          curve: Curves.easeOut,
        ))
        .obs;

    slideFromRight = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    )
        .animate(CurvedAnimation(
          parent: controller2,
          curve: Curves.easeOut,
        ))
        .obs;
    controller.forward();
    controller1.forward();
    controller2.forward();
  }

  @override
  void dispose() {
    controller2.dispose();
    controller1.dispose();
    controller.dispose();
    super.dispose();
  }
}
