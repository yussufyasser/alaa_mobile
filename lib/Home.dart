import 'package:flutter/material.dart';
import 'package:student/MyAppbar.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppbar.theappbar(context),
      body: Container(),
    );
  }
  
}
