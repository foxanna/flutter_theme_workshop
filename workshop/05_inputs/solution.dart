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
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(
            fontStyle: FontStyle.italic,
          ),
          floatingLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.lightGreen,
          ),
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 14.0,
          ),
          suffixIconColor: Colors.greenAccent,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen, width: 2)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.lightGreen,
          selectionColor: Colors.lime,
          selectionHandleColor: Colors.lightGreen,
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
