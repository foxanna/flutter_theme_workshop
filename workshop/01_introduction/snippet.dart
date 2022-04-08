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

      // Consider removing the `const` from Padding? Otherwise, when you
      // wrap the `ExampleWidget` with a `Theme`, you get a `const` error
      // message. Dartpad shows errors in a bit of a funky way sometimes, and it
      // took me a minute to figure out my solution was highlighted in red.
      //
      // Alternatively, warn them about the potential error and how to fix it?
      //
      // I dunno what's best here, const is important, but it distracts from the
      // topic at hand :)
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          // TODO 1: Apply a Theme widget over ExampleWidget.
          //
          // Tip: Place your cursor over the ExampleWidget text below and hit
          // alt + enter on Windows/Linux or option + return on Mac. Then,
          // select "Wrap with widget..." from the dropdown menu that appears.

          // Reviewers note: I've been trying to help teach folks Dartpad /
          // their IDE tools along the way. Please take or leave this "hint"
          // suggestion :)
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
