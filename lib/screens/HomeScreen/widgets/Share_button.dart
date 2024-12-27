import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:heart_app/utils/consts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';

class ShareButton extends StatelessWidget {
  final ScreenshotController screenshotController;

  const ShareButton({required this.screenshotController, super.key});

  Future<void> _takeScreenshotAndShare(BuildContext context) async {
    try {
      Uint8List? image = await screenshotController.capture();

      if (image != null) {
        final directory = await getTemporaryDirectory();
        final imagePath = '${directory.path}/screenshot.png';
        final file = File(imagePath);
        await file.writeAsBytes(image);
        XFile xFile = XFile(imagePath);
        await Share.shareXFiles([xFile], text: 'Check out this screenshot!');
      } else {
        print("No image captured.");
      }
    } catch (e) {
      print("Error capturing or sharing screenshot: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      height: 55,
      decoration: BoxDecoration(
        color: ppink,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton.icon(
        onPressed: () {
          _takeScreenshotAndShare(context);
        },
        icon: const Icon(
          Icons.share,
          color: Colors.white,
          size: 30,
        ),
        label: const Text(
          'Share',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: ppink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
