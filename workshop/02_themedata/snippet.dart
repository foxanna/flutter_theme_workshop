import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // TODO 2: Provide and customize value for theme field
      // TODO 3: Provide value for darkTheme field, specify themeMode value
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          // TODO 1: Remove the Theme widget
          child: Theme(
            data: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.yellow,
                ),
              ),
            ),
            child: const ExampleWidget(),
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
      children: [
        ElevatedButton(
          child: const Text('first'),
          onPressed: () {},
        ),
        ElevatedButton(
          child: const Text('second'),
          onPressed: () {},
        ),
        ElevatedButton(
          child: const Text('third'),
          onPressed: () {},
        ),
      ],
    );
  }
}
