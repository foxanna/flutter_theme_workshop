import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      body: Center(
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
    );
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
