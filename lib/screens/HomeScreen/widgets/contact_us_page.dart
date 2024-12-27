import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'.tr()), // Translation for Contact Us
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Text(
                'Contact Us'.tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20),

              // Introduction Section
              Text(
                'We would love to hear from you! If you have any questions or concerns, feel free to reach out to us.'
                    .tr(),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Email Section
              Text(
                'Email'.tr(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'support@example.com', // Your contact email
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Phone Section
              Text(
                'Phone'.tr(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '+123 456 7890', // Your contact phone number
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Address Section
              Text(
                'Address'.tr(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '123 Example Street, City, Country', // Your office address
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Social Media Section
              Text(
                'Follow Us'.tr(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {
                      // Facebook link
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {
                      // Twitter link
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {
                      // Instagram link
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Contact Form Section
              Text(
                'Message Us'.tr(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Your Message'.tr(),
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Send message functionality
                },
                child: Text('Send Message'.tr()),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
