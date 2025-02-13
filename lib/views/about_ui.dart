import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  //โทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/saulogo.png',
              width: 150,
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'แอปพลิเคชั้นร้านหมูกระทะ\nเพื่อคนไทย\nโดยเด็กไทย\nสนใจแอปพลิเคชั้นติดต่อ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'เด็กไอที SAU',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _makePhoneCall('1112');
              },
              child: Image.asset(
                'assets/images/sauqr.png',
                height: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
