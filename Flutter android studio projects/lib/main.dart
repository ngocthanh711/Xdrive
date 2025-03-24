import 'package:flutter/material.dart';
import 'package:phenikaaxdrive/customer_support.dart';
import 'package:phenikaaxdrive/rating.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Support(),
    );
  }
}

