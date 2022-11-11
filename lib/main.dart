import 'package:flutter/material.dart';
import 'package:scroll_to_appbar_hide/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scroll to AppBar Hide',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const Dashboard(),
    );
  }
}
