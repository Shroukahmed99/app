import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeContent extends StatelessWidget {
  final ScreenshotController screenshotController;
  final Future<void> Function(BuildContext context) onShare;

  const HomeContent({
    Key? key,
    required this.screenshotController,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progressValue = 90.0;

    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.language, color: Colors.black),
                  onPressed: () {
                    final currentLocale = context.locale.languageCode;
                    if (currentLocale == 'en') {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                  },
                ),
                Text(
                  context.locale.languageCode == 'en' ? 'English' : 'العربية',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'score_label'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: progressValue / 100,
                backgroundColor: Colors.grey[300],
                color: Colors.green,
                minHeight: 16,
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'question_text'.tr(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => onShare(context),
                icon: Icon(Icons.share),
                label: Text('share_screenshot'.tr()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
