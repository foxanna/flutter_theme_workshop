// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        textTheme: Typography().black
            .apply(
              displayColor: Colors.greenAccent,
              bodyColor: Colors.green,
            )
            .copyWith(
              displayLarge: TextStyle(
                color: Colors.lightGreen,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
        iconTheme: IconThemeData(
          color: Colors.lime,
          size: 36.0,
        ),
      ),
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
          child: ExampleWidget(),
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
        Icon(Icons.account_circle),
        Text('displayLarge', style: Theme.of(context).textTheme.displayLarge),
        Text('explicit bodyMedium', style: Theme.of(context).textTheme.bodyMedium),
        Text('implicit bodyMedium'),
        Text('labelSmall', style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
