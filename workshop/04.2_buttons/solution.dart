import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ButtonOverlayColor implements MaterialStateProperty<Color?> {
  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return Colors.greenAccent;
    }
    if (states.contains(MaterialState.pressed)) {
      return Colors.lightGreenAccent;
    }
    return null;
  }
}

class ButtonTextStyle implements MaterialStateProperty<TextStyle?> {
  @override
  TextStyle? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const TextStyle(fontWeight: FontWeight.bold);
    }
    return null;
  }
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

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
            overlayColor: ButtonOverlayColor(),
            textStyle: ButtonTextStyle(),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.green),
            side: MaterialStateProperty.all(
              const BorderSide(color: Colors.green, width: 2),
            ),
            overlayColor: ButtonOverlayColor(),
            textStyle: ButtonTextStyle(),
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
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
      children: <Widget>[
        ElevatedButton(child: const Text('ElevatedButton'), onPressed: () {}),
        OutlinedButton(child: const Text('OutlinedButton'), onPressed: () {}),
        TextButton(child: const Text('TextButton'), onPressed: () {}),
      ],
    );
  }
}
