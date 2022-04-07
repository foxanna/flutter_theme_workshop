# Styling screens

The last styling task for today is configuring the screen skeleton: `Scaffold` and `AppBar` widgets.

## Scaffold widget

`Scaffold` is a fundamental widget responsible for screen layout and behaviour, and it does not have much styling possibilities in it. The individual `Scaffold` background can be changed with:

```dart
Scaffold(
  backgroundColor: Colors.green[50],
  body: ...
)
```

And to apply such configuration to all `Scaffold` widgets, you have to modify `ColorScheme.background` property**:

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green, 
      background: Colors.green[50],
    ),
  ),
  ...
)
```


Or, if you have been using a `colorSchemeSeed` property to create a `ColorScheme`, you can set a `scaffoldBackgroundColor` field:

```dart
MaterialApp(
  theme: ThemeData(
    colorSchemeSeed: Colors.green,
    scaffoldBackgroundColor: Colors.green[50],
  ),
  ...
)
```

## AppBar widget

To consistently apply a particular style to all `AppBar` widgets, you can specify the `appBarTheme` field of the global `ThemeData` object:

```dart
MaterialApp(
  theme: ThemeData(
    appBarTheme: AppBarTheme(...),
  ),
  ...
)
```

Some of customizable `AppBarTheme` properties are:

```dart
AppBarTheme(
  backgroundColor: Colors.lime,
  foregroundColor: Colors.blue,
  elevation: 8.0,
  actionsIconTheme: IconThemeData(color: Colors.blue),
  centerTitle: false,
  ...
)
```

## Your turn

1. Modify global `ColorScheme` by providing `background` field value**.
2. Define global `appBarTheme` using customizations given above.


** The above would only be valid if [this issue](https://github.com/flutter/flutter/issues/101389) fix is released before the event