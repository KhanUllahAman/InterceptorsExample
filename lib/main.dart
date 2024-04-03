import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:interceptorswork/home_page.dart';

Alice alice = Alice();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: alice.getNavigatorKey(),
      home: Homepage(),
    );
  }
}
