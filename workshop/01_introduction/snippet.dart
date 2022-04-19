import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExamplePage(),
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
        padding: EdgeInsets.all(20.0),
        child: Center(
          // TODO 1: Apply a Theme widget over ExampleWidget

          // Tip: Place your cursor over the ExampleWidget text below and hit
          // alt + enter on Windows/Linux or option + return on Mac. Then,
          // select "Wrap with widget..." from the dropdown menu that appears.
          child: const ExampleWidget(),
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
