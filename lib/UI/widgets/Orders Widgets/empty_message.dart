import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            'assets/lotties/empty.json',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          const Text("Empty")
        ],
      ),
    );
  }
}