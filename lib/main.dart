import 'package:flutter/material.dart';
import './AllTests.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(primaryColor: Colors.grey[400]),
      home: AllTests(),
    );
  }
}
