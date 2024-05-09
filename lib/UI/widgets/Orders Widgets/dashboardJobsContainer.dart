import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../components/components.dart';

class DashboardJobContainer extends StatelessWidget {
  const DashboardJobContainer(
      {super.key,
      required this.title,
      required this.count,
      required this.icon,
      required this.color});

  final String title;
  final String count;
  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFFB1F3EB)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  scale: 8.1,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    count,
                    style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: Container(
                height: 65,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [const Color(0xFFB1F3EB), color!],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),
                  color: color,
                ),
                padding: const EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(title,
                        style: titleTextStyle.copyWith(color: Colors.white, fontSize: 20))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
