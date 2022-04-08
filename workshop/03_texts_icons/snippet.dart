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
        // TODO 1: Provide and customize value for textTheme field
        // TODO 2: Provide value for iconTheme field
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
