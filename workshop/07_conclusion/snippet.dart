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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              'Don\'t have an account yet?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'email',
            suffixIcon: Icon(Icons.email),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(child: Text('Skip'), onPressed: () {}),
            ElevatedButton(child: Text('Register'), onPressed: () {}),
          ],
        ),
      ],
    );
  }
}
