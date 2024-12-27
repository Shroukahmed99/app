import 'package:flutter/material.dart';

class CustomCenterContent extends StatelessWidget {
  final Animation<double> _scaleAnimation;

  const CustomCenterContent({
    super.key,
    required Animation<double> scaleAnimation,
  }) : _scaleAnimation = scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ScaleTransition(
            scale: _scaleAnimation,
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 130,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'heart Sync',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'connecting Hearts',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
