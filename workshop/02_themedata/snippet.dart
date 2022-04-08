// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO 2: Provide and customize value for theme field
      // TODO 3: Provide value for darkTheme field, specify themeMode value
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consistent design with Flutter Theme'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          // TODO 1: Remove the Theme widget
          child: Theme(
            data: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lime,
                  onPrimary: Colors.blue,
                ),
              ),
            ),
            child: ExampleWidget(),
          ),
        ),
      ),
    );
  }
}

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(child: Text('first'), onPressed: () {}),
        ElevatedButton(child: Text('second'), onPressed: () {}),
        ElevatedButton(child: Text('third'), onPressed: () {}),
      ],
    );
  }
}
