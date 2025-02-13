import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sau_mukratha_app/views/about_ui.dart';
import 'package:sau_mukratha_app/views/cal_bill_ui.dart';
import 'package:sau_mukratha_app/views/menu_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //ควบคุม animated notch bottom bar
  NotchBottomBarController _controller = NotchBottomBarController(index: 1);

  //เก็บตัวแปร something
  List<Widget> viewInbody = [
    CalBillUI(),
    MenuUI(),
    AboutUI(),
  ];

  //เก็บ index ของหน้าจอที่จะแสดง
  int indexShow = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Tech SAU BUFFET',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (valueParam) {
          setState(() {
            indexShow = valueParam;
          });
        },
        kIconSize: 24.0,
        kBottomRadius: 28.0,
        notchColor: Colors.deepOrange,
        color: Colors.deepOrange,
        notchBottomBarController: _controller,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            itemLabel: 'คิดเงิน',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.star_half,
              color: Colors.white,
            ),
            itemLabel: 'เกี่ยวกับ',
          ),

          ///svg item
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.star,
              color: Colors.white,
            ),
            itemLabel: 'Menu',
          ),
        ],
      ),
      body: viewInbody[indexShow],
    );
  }
}
