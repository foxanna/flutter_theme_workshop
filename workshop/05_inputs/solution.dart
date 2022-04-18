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
          border: MaterialStateOutlineInputBorder.resolveWith((states) {
            final isFocused = states.contains(MaterialState.focused);
            final isDisabled = states.contains(MaterialState.disabled);
            final hasError = states.contains(MaterialState.error);

            final color = isDisabled ? Colors.grey : hasError ? Colors.red : Colors.lightGreen;
            final width = isFocused ? 2.0 : 1.0;

            return OutlineInputBorder(borderSide: BorderSide(color: color, width: width));
          }),
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
