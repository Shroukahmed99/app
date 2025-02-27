import 'package:flutter/material.dart';

class CustomProgressLinearIndicator extends StatelessWidget {
  final double progress;
  final double height;
  final Color progressColor;
  final Color backgroundColor;

  const CustomProgressLinearIndicator({
    Key? key,
    required this.progress,
    this.height = 16,
    this.progressColor = Colors.green, // يمكنك تخصيص اللون حسب الحاجة
    this.backgroundColor = Colors.grey, // يمكنك تخصيص اللون حسب الحاجة
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 258,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: progress,
                height: height,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
