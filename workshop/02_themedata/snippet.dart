import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Reviewers note: Had to remove const from here as well while coding up the
    // solution since `Theme` isn't an immutable object.
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
          //
          // Tip: Once again, you can place your cursor over the "Theme" widget
          // below and hit alt + enter on Windows/Linux or option + return on
          // Mac. Then, select "remove this widget" from the dropdown menu that
          // appears.
          //
          // Reviewers note: Again, optional but I teach a lot of devs who do
          // not know about the "Remove widget" trick :)
          child: Theme(
            data: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lime,
                  onPrimary: Colors.blue,
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
