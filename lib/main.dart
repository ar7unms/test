import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_program/loginpage.dart';

void main()
{
  runApp(mainpage());
}
class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loginpage(),
    );
  }
}
