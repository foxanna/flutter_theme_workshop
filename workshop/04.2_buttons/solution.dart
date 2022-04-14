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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.hovered))
                return Colors.greenAccent;
              if (states.contains(MaterialState.pressed))
                return Colors.lightGreenAccent;
              return null;
            }),
            textStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) =>
                states.contains(MaterialState.pressed)
                    ? TextStyle(fontWeight: FontWeight.bold)
                    : null),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
            side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.green, width: 2)),
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.hovered))
                return Colors.lime.withOpacity(0.2);
              if (states.contains(MaterialState.pressed))
                return Colors.lime.withOpacity(0.4);
              return null;
            }),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.lightGreen,
          ),
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
        ElevatedButton(child: Text('ElevatedButton'), onPressed: () {}),
        OutlinedButton(child: Text('OutlinedButton'), onPressed: () {}),
        TextButton(child: Text('TextButton'), onPressed: () {}),
      ],
    );
  }
}
