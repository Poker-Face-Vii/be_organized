import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(5),
                  //   bottomLeft: Radius.circular(5),
                  // ),
                ),
              ),Container()
            ],
          ),
        ),
      ),
    );
  }
}
