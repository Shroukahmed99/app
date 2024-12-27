import 'package:flutter/material.dart';
import 'package:heart_app/screens/HomeScreen/home_screen.dart';
import 'package:heart_app/screens/splash/widgets/background_questionIcon.dart';
import 'package:heart_app/screens/splash/widgets/custom_background.dart';
import 'package:heart_app/screens/splash/widgets/custom_center_content.dart';
import 'package:heart_app/screens/splash/widgets/custom_footer_text.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
     Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.easeInOut;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(),
          BackgroundQuestionicon(),
          CustomCenterContent(
            scaleAnimation: _scaleAnimation,
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: CustomFooterText(),
          ),
        ],
      ),
    );
  }
}
