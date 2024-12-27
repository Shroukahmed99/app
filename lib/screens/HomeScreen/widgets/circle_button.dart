import 'package:flutter/material.dart';
import 'package:heart_app/utils/consts.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircularButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16), 
        backgroundColor: ppink, 
        elevation: 4, 
      ),
      child: Icon(
        icon,
        color: Colors.white, 
        size: 24, 
      ),
    );
  }
}
