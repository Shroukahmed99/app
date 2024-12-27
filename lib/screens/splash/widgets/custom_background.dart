import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFC7E5), Color(0xFF817AFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          );
  }
}