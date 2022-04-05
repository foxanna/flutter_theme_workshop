import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.hovered)) return Colors.greenAccent;
              if (states.contains(MaterialState.pressed)) return Colors.lightGreenAccent;
              return null;
            }),
            textStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) =>
            states.contains(MaterialState.pressed)
                ? const TextStyle(fontWeight: FontWeight.bold)
                : null),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
            side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.green, width: 2)),
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.hovered)) return Colors.lime.withOpacity(0.2);
              if (states.contains(MaterialState.pressed)) return Colors.lime.withOpacity(0.4);
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
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: ExampleWidget(),
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
          onPressed: () {},
          child: const Text('ElevatedButton'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('OutlinedButton'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('TextButton'),
        ),
      ],
    );
  }
}
