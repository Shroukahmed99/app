import 'package:flutter/material.dart';
import 'package:heart_app/utils/consts.dart';

class CustomContainerScore extends StatelessWidget {
  const CustomContainerScore({super.key});
  final int score = 35;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: blue,  // اللون الأزرق للحدود
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$score', 
                style: TextStyle(
                  fontSize: 20,
                  color: ppink,  
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' / 100', 
                style: TextStyle(
                  fontSize: 20,
                  color: blue,  
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
