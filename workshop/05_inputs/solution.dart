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
        inputDecorationTheme: const InputDecorationTheme(
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
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen, width: 2)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.lightGreen,
          selectionColor: Colors.lime,
          selectionHandleColor: Colors.lightGreen,
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
      children: const [
        TextField(
          decoration: InputDecoration(
            hintText: 'enabled',
            labelText: 'label',
            suffixIcon: Icon(Icons.adb),
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
