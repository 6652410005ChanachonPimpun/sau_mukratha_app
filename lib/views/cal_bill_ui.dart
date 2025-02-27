import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sau_mukratha_app/views/show_bill_ui.dart';

class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUIState();
}

class _CalBillUIState extends State<CalBillUI> {
//สร้างตัวแปรให้กับ จำนวน ผู้มหญ่
  bool adultCheck = false;
  bool childCheck = false;
  bool cockCheck = false;
  bool powCheck = false;

//ควบคุม textfiled
  TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController childCtrl = TextEditingController(text: '0');
  TextEditingController cockCtrl = TextEditingController(text: '0');
  TextEditingController powCtrl = TextEditingController(text: '0');

//สร้างตัวแปรใช้กับน้ำ
  int waterCheck = 1;

//สร้างตัวแปรเก็บรูปที่ถ่าย
  File? imgFile;

//สร้าง method เปิดกล้องเพื่อถ่ายรูป
  Future<void> openCamera() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 75,
    );
//ตรวจสอบว่าถ่ายมั้ย
    if (picker == null) return;

//ถ้าถ่าย ไปกำหนดให้ imgfile
    setState(() {
      imgFile = File(picker.path);
    });
  }

  //ตัวแปรเก็บประเภทสมาชิก
  List<String> memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิกทั่วไปลด 5%',
    'สมาชิก VIP 20%',
  ];

  double discount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 35.0,
            right: 35.0,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    openCamera();
                  },
                  child: imgFile == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          height: 120.0,
                        )
                      : Image.file(
                          imgFile!,
                          height: 120.0,
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valueparam) {
                        setState(() {
                          adultCheck = valueparam!;
                          if (valueparam == true) {
                            adultCtrl.text = '0';
                          }
                        });
                      },
                      value: adultCheck,
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: adultCheck,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Text(
                      'คน',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valueparam) {
                        setState(() {
                          childCheck = valueparam!;
                          if (valueparam == true) {
                            childCtrl.text = '0';
                          }
                        });
                      },
                      value: childCheck,
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: childCheck,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Text('คน'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุปเฟต์น้ำดื่ม',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          waterCheck = valueParam!;
                          if (valueParam == 1) {
                            cockCtrl.text = '0';
                            powCtrl.text = '0';
                          }
                        });
                      },
                      value: 1,
                      groupValue: waterCheck,
                    ),
                    Text('รับ 25 บาท/หัว'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          waterCheck = valueParam!;
                        });
                      },
                      value: 2,
                      groupValue: waterCheck,
                    ),
                    Text('ไม่รับ'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '         โค้ก 20 บาท/ชวด จำนวน   ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: waterCheck == 1 ? false : true,
                        controller: cockCtrl,
                      ),
                    ),
                    Text(
                      'ขวด',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '         น้ำเปล่า 15 บาท/ขวด    ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: waterCheck == 1 ? false : true,
                        controller: powCtrl,
                      ),
                    ),
                    Text('ขวด'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // dropdown ประเภทสมาชิก
                DropdownButton(
                  value: discount,
                  isExpanded: true,
                  items: memberType
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          value: memberType.indexOf(e).toDouble(),
                        ),
                      )
                      .toList(),
                  onChanged: (valueParam) {
                    switch (valueParam) {
                      case 0:
                        discount = 0;
                        break;
                      case 1:
                        discount = 0.05;
                        break;
                      case 2:
                        discount = 0.2;
                        break;
                    }
                  },
                ),
                SizedBox(
                  height: 50.0,
                ),
                //ปุ่ม
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          //validate UI
                          if (imgFile == null) {
                          } else if (adultCheck == true &&
                                  adultCtrl.text == '0' ||
                              adultCtrl.text.length == 0) {
                          } else if (childCheck == true &&
                                  childCtrl.text == '0' ||
                              childCtrl.text.length == 0) {
                          } else {
                            int adult = int.parse(adultCtrl.text);
                            int child = int.parse(adultCtrl.text);
                            int cock = int.parse(adultCtrl.text);
                            int pow = int.parse(adultCtrl.text);
                            double paywaterBuffer =
                                waterCheck == 1 ? 25.0 * (adult + child) : 0;
                            double paytotal = (229 * adult) +
                                (69.0 * child) +
                                (20.0 * cock) +
                                (15.0 * pow) +
                                paywaterBuffer;

                            paytotal = paytotal - (paytotal * discount);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowBillUI(
                                          paytotal: paytotal,
                                          imgFile: imgFile,
                                        )));
                          }
                        },
                        icon: Icon(Icons.calculate),
                        label: Text('คํานวณ'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.infinity,
                            50,
                          ),
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.cancel),
                        label: Text('ยกเลิก'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.infinity,
                            50,
                          ),
                          backgroundColor: Colors.tealAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
