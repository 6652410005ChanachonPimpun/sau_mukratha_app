import 'package:flutter/material.dart';
import 'dart:io';

class ShowBillUI extends StatefulWidget {
  double? paytotal;
  File? imgFile;

  ShowBillUI({super.key, this.paytotal, this.imgFile});

  @override
  State<ShowBillUI> createState() => _ShowBillUIState();
}

class _ShowBillUIState extends State<ShowBillUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Show bill',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Total: ${widget.paytotal}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.file(
              widget.imgFile!,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
