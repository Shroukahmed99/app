import 'package:flutter/material.dart';
import 'package:heart_app/utils/consts.dart';

class CustomQuestionWidget extends StatelessWidget {
  final String questionText;

  const CustomQuestionWidget({
    Key? key,
    required this.questionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,  
      padding: const EdgeInsets.all(20.0), 
      decoration: BoxDecoration(
        color: grey,  
        borderRadius: BorderRadius.circular(15),  
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),  
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        questionText,
        style: const TextStyle(
          fontFamily: 'Inter',  
          fontWeight: FontWeight.w500,  
          fontSize: 28,  
          color: Colors.black,  
        ),
        textAlign: TextAlign.center,  
      ),
    );
  }
}
