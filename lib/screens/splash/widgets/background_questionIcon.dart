import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BackgroundQuestionicon extends StatelessWidget {
  const BackgroundQuestionicon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:50),
      child: Opacity(
        opacity: 0.1,
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.question,
            size: 550,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
