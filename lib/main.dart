import 'package:flutter/material.dart';
import 'package:profiepage3/profile3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile3(),
    );
  }
}
