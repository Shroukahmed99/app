import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:heart_app/utils/consts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';


class ShareButton extends StatelessWidget {
  ShareButton({super.key});

  final ScreenshotController screenshotController = ScreenshotController();

  // Function to save screenshot as a temporary file and share it
  Future<void> _takeScreenshotAndShare(BuildContext context) async {
    try {
      // Capture screenshot
      Uint8List? image = await screenshotController.capture();

      if (image != null) {
        // Get the directory to store the file
        final directory = await getTemporaryDirectory();
        final imagePath = '${directory.path}/screenshot.png';

        // Write the image to a file
        final file = File(imagePath);
        await file.writeAsBytes(image);

        // تحويل المسار إلى XFile
        XFile xFile = XFile(imagePath);

        // Share the image file
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
    return Center(
      child: Screenshot(
        controller: screenshotController,
        child: Container(
          width: 216,
          height: 55,
          decoration: BoxDecoration(
            color: ppink, // Ensure ppink is defined in your consts.dart file
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
              backgroundColor: ppink, // Ensure ppink is defined
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
