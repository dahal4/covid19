import 'package:covid19/homepage.dart';
import 'package:covid19/widgets/gradientColor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
          primarySwatch: GradientColors.pink,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
            ),
            button: TextStyle(
              color: Colors.white,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
            hintStyle: TextStyle(
              color: GradientColors.pink[200],
            ),
          ),
          cursorColor: GradientColors.pink[400],
        ),
    home:HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
