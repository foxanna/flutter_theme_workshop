import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: const TextStyle(fontStyle: FontStyle.italic),
          floatingLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.lightGreen,
          ),
          hintStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 14.0,
          ),
          suffixIconColor: Colors.greenAccent,
          border: MaterialStateOutlineInputBorder.resolveWith(
            (Set<MaterialState> states) {
              final bool isFocused = states.contains(MaterialState.focused);
              final bool isDisabled = states.contains(MaterialState.disabled);
              final bool hasError = states.contains(MaterialState.error);

              final MaterialColor color = isDisabled
                  ? Colors.grey
                  : hasError
                      ? Colors.red
                      : Colors.lightGreen;
              final double width = isFocused ? 2.0 : 1.0;

              return OutlineInputBorder(
                borderSide: BorderSide(color: color, width: width),
              );
            },
          ),
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
      children: const <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: 'enabled',
            labelText: 'label',
            suffixIcon: Icon(Icons.email),
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
