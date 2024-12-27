import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/screens/HomeScreen/widgets/Share_button.dart';
import 'package:heart_app/screens/HomeScreen/widgets/circle_button.dart';
import 'package:heart_app/screens/HomeScreen/widgets/custom_container_score.dart';
import 'package:heart_app/screens/HomeScreen/widgets/custom_drawer.dart';
import 'package:heart_app/screens/HomeScreen/widgets/custom_progress_linear_indicator.dart';
import 'package:heart_app/screens/HomeScreen/widgets/custom_question_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final progressValue = 90.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomContainerScore(),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          spacing: 50,
          children: [
            CustomProgressLinearIndicator(
              progress: progressValue,
              height: 16,
              progressColor: Colors.green,
              backgroundColor: Colors.grey,
            ),
            CustomQuestionWidget(
              questionText:
              'What is your deepest fear, and how do you think it impacts the decisions you make in life?',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularButton(
                  icon: Icons.arrow_back,
                  onPressed: () {},
                ),
                CircularButton(
                  icon: Icons.arrow_forward,
                  onPressed: () {},
                ),
              ],
            ),
            ShareButton(),
          ],
        ),
      ),
    );
  }
}
