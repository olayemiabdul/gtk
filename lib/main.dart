import 'package:api_univaciti/home/homePgae.dart';
import 'package:flutter/material.dart';

void main() => runApp(abdulApp());

class abdulApp extends StatelessWidget {
  const abdulApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: abdulPage(),
    );
  }
}
