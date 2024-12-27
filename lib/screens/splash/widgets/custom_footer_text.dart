import 'package:flutter/material.dart';

class CustomFooterText extends StatelessWidget {
  const CustomFooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Alignment.bottomCenter ,
      child: Text.rich(
                  TextSpan(
                    text: 'Powered by ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'SA',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                           fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'P',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Q',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                           fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}