// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // TODO 1: Provide theme field value
      // TODO 3: Provide darkTheme field value, specify themeMode
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consistent design with Flutter Theme'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          // TODO 2: Remove the Theme widget

          // Tip: Once again, you can place your cursor over the "Theme" widget below
          // and hit alt + enter on Windows/Linux or option + return on Mac.
          // Then, select "Remove this widget" from the dropdown menu that appears.
          child: Theme(
            data: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
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
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton(child: const Text('first'), onPressed: () {}),
        ElevatedButton(child: const Text('second'), onPressed: () {}),
        ElevatedButton(child: const Text('third'), onPressed: () {}),
      ],
    );
  }
}
