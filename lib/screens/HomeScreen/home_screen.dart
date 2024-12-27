import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:heart_app/screens/HomeScreen/widgets/contact_us_page.dart';
import 'package:heart_app/screens/HomeScreen/widgets/home_content.dart';
import 'package:heart_app/screens/HomeScreen/widgets/privacy_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:easy_localization/easy_localization.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> _takeScreenshotAndShare(BuildContext context) async {
    try {
      Uint8List? image = await screenshotController.capture();
      if (image != null) {
        final directory = await getTemporaryDirectory();
        final imagePath = '${directory.path}/screenshot.png';
        final file = File(imagePath);
        await file.writeAsBytes(image);
        XFile xFile = XFile(imagePath);
        await Share.shareXFiles([xFile], text: 'share_screenshot'.tr());
      } else {
        print("No image captured.");
      }
    } catch (e) {
      print("Error capturing or sharing screenshot: $e");
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      HomeContent(screenshotController: screenshotController, onShare: _takeScreenshotAndShare),
      PrivacyPage(),
      ContactUsPage(),
    ];

    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Privacy'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact Us'.tr(),
          ),
        ],
      ),
    );
  }
}
