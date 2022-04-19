import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

// TODO 1: Declare ButtonOverlayColor and ButtonTextStyle classes

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
            // TODO 2: Replace overlayColor field value with an instance of ButtonOverlayColor
            overlayColor: MaterialStateProperty.resolveWith(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.greenAccent;
                }
                if (states.contains(MaterialState.pressed)) {
                  return Colors.lightGreenAccent;
                }
                return null;
              },
            ),
            // TODO 2: Replace textStyle field value with an instance of ButtonTextStyle
            textStyle: MaterialStateProperty.resolveWith(
              (Set<MaterialState> states) =>
                  states.contains(MaterialState.pressed)
                      ? const TextStyle(fontWeight: FontWeight.bold)
                      : null,
            ),
          ),
        ),
        // TODO 3: Provide outlinedButtonTheme field value
        // TODO 4: Provide textButtonTheme field value
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
      children: <Widget>[
        ElevatedButton(child: const Text('ElevatedButton'), onPressed: () {}),
        OutlinedButton(child: const Text('OutlinedButton'), onPressed: () {}),
        TextButton(child: const Text('TextButton'), onPressed: () {}),
      ],
    );
  }
}
