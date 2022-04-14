// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        // TODO 1: Provide inputDecorationTheme field value
        // TODO 2: Provide textSelectionTheme field value
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
        actions: [IconButton(icon: Icon(Icons.account_circle), onPressed: () {})],
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
        TextField(
          decoration: InputDecoration(
            hintText: 'enabled',
            labelText: 'label',
            suffixIcon: Icon(Icons.email),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'enabled error',
            errorText: 'error',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'disabled',
          ),
          enabled: false,
        ),
      ],
    );
  }
}
