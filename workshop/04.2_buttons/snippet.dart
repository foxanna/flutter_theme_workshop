// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp());
}

// TODO 1: Declare ButtonOverlayColor and ButtonTextStyle classes

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lime),
            foregroundColor: MaterialStateProperty.all(Colors.blue),
            // TODO 2: Replace overlayColor field value with an instance of ButtonOverlayColor
            overlayColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered))
                return Colors.greenAccent;
              if (states.contains(MaterialState.pressed))
                return Colors.lightGreenAccent;
              return null;
            }),
            // TODO 2: Replace textStyle field value with an instance of ButtonTextStyle
            textStyle: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.pressed)
                ? TextStyle(fontWeight: FontWeight.bold)
                : null
            ),
          ),
        ),
        // TODO 3: Provide outlinedButtonTheme field value
        // TODO 4: Provide textButtonTheme field value
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
