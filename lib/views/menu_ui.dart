import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuUI extends StatefulWidget {
  const MenuUI({super.key});

  @override
  State<MenuUI> createState() => _MenuUIState();
}

class _MenuUIState extends State<MenuUI> {
  //เก็บรูป เมนู
  List<String> menuShow = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
  ];

  //เก็บรูป สาขา
  List<String> branchShop = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
  ];

  List<String> shopLocation = [
    'https://www.google.co.th/maps/@18.3170581,99.3986862,3854m',
    'https://www.google.co.th/maps/@20.7054513,300.3561162',
    'https://www.google.co.th/maps/@50.7054513,120.3561162',
    'https://www.google.co.th/maps/@2.7054513,600.3561162',
    'https://www.google.co.th/maps/@33.7054513,250.3561162',
  ];

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'เมนูเด็ด',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 30, right: 30),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuShow.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        menuShow[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'ร้านในเครือ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: branchShop.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 35,
                      right: 35,
                      bottom: 15,
                    ),
                    child: InkWell(
                      onTap: () {
                        _launchInBrowser(
                          Uri.parse(shopLocation[index]),
                        );
                      },
                      child: Image.asset(
                        branchShop[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
