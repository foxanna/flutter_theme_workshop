# Styling screens

The last styling task for today is configuring the screen skeleton: `Scaffold` and `AppBar` widgets.

Check the code snippet on the right. The `ExampleWidget` content changed to a scrollable list of lime boxes.

## Scaffold style

`Scaffold` is a fundamental widget responsible for screen layout and behaviour, and it does not have much styling possibilities in it. The individual `Scaffold` background can be changed with:

```dart
Scaffold(
  backgroundColor: Colors.green[50],
  body: ...
)
```

And to apply such configuration to all `Scaffold` widgets, you have to modify `scaffoldBackgroundColor` field value:

```dart
MaterialApp(
  theme: ThemeData(
    scaffoldBackgroundColor: Colors.green[50],
  ),
  ...
)
```

## AppBar style

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
  foregroundColor: Colors.white,
  elevation: 8.0,
  actionsIconTheme: IconThemeData(color: Colors.white),
  centerTitle: false,
)
```

`AppBarTheme` gives a chance to override the look of `IconButton` widgets inside the `AppBar` with `actionsIconTheme` if you have earlier provided the global `iconTheme` value.

Remember the `MaterialStateColor` class from previous workshop step? The one that enables providing `MaterialStateProperty<Color>` to a field of type `Color`. The `AppBar` background can change responding to `scrolledUnder` material state:

```dart
AppBarTheme(
  backgroundColor: MaterialStateColor.resolveWith((states) {
    return states.contains(MaterialState.scrolledUnder)
        ? Colors.limeAccent
        : Colors.lime;
  }),
)
```

## Your turn

1. Modify global `ThemeData` by providing `scaffoldBackgroundColor` field value.
2. Define global `appBarTheme` using customizations given above. Set `backgroundColor` field of the `AppBarTheme` to a `MaterialStateColor` instance. Scroll the list of lime boxes to see the `AppBar` background change<img alt="Google Analytics" src="https://www.google-analytics.com/collect?v=1&cid=1&t=pageview&ec=workshop&ea=open&dp=step09&tid=UA-227136526-1" style="width: 1px; height: 1px"/>.
