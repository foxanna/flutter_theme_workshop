# Styling inputs

Check the code snippet on the right. The `ExampleWidget` content changed to `TextField` widgets in different states with various decorations.

## TextField style

Hopefully, by now it's no surprise for you that the `ThemeData` object exposes a field to customize the look of the `TextField` widget - `inputDecorationTheme` of type `InputDecorationTheme`:

```dart
MaterialApp(
  theme: ThemeData(
    inputDecorationTheme: InputDecorationTheme(...),
  ),
  ...
)
```

The `InputDecorationTheme` class has about 30 fields dedicated to different aspects of `TextField` UI and behavior. Here are some of them:

```dart
InputDecorationTheme(
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
)
```

Additionally, text style of the `hint` and of the `text` entered in the `TextField` can be implicitly controlled by the `titleMedium` field of the `TextTheme`, error style - by `bodySmall`.

## TextField borders

`TextField` borders deserve a special attention. They are:

* `enabledBorder` - the border to display when the widget is enabled and is not showing an error;
* `focusedBorder` - the border to display when the widget has the focus and is not showing an error;
* `errorBorder` - the border to display when the widget does not have the focus and is showing an error;
* `focusedErrorBorder` - the border to display when the widget has the focus and is showing an error;
* `disabledBorder` - the border to display when the widget is disabled and is not showing an error;
* `border` - this property is only used when the appropriate one of the above is not specified.

These values default to `UnderlineInputBorder` which draws a horizontal line at the bottom of a widget. Instead, let's define a custom set of borders using an `OutlineInputBorder` which draws a rounded rectangle around the widget. It should be twice thicker when focused, light green when enabled, red in case of error, and grey when disabled:

```dart
InputDecorationTheme(
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightGreen, width: 2)),
  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
)
```

That is a lot of similar code to write. Would not it be cool to leverage the `MaterialStateProperty` mechanism and react to different `TextField` material states in a single callback?

## MaterialStateProperty compatibility

There are material widgets with fields that can accept both values of simple types you are used to like `Color` or `TextStyle`, and the `MaterialStateProperty` variant of that type. It is possible thanks to compatibility bridge classes like:

```dart
class MaterialStateColor extends Color implements MaterialStateProperty<Color> {
  ...
}
```

An instance of `MaterialStateColor` class can be assigned to a widget's field of type `Color`. At the same time a widget can accept a `MaterialStateProperty<Color>` value and benefit from reacting to interactive material states. There are several compatibility bridges implemented:

* `MaterialStateColor`
* `MaterialStateMouseCursor`
* `MaterialStateBorderSide`
* `MaterialStateOutlinedBorder`
* `MaterialStateTextStyle`
* `MaterialStateOutlineInputBorder`
* `MaterialStateUnderlineInputBorder`

Back to styling `TextField` borders, the documentation for the `border` field of `InputDecorationTheme`states: 

```dart
class InputDecorationTheme {
  /// The shape of the border to draw around the decoration's container.
  ///
  /// If [border] is a [MaterialStateUnderlineInputBorder]
  /// or [MaterialStateOutlineInputBorder], then the effective border can depend on
  /// the [MaterialState.focused] state, i.e. if the [TextField] is focused or not.
  final InputBorder? border;
}
```

This means that to repeat the borders styling above, instead of providing five different borders, it is possible to provide just one of type `MaterialStateOutlineInputBorder`:

```dart
InputDecorationTheme(
  border: MaterialStateOutlineInputBorder.resolveWith((states) {
    final isFocused = states.contains(MaterialState.focused);
    final isDisabled = states.contains(MaterialState.disabled);
    final hasError = states.contains(MaterialState.error);

    final color = isDisabled ? Colors.grey : hasError ? Colors.red : Colors.lightGreen;
    final width = isFocused ? 2.0 : 1.0;
    
    return OutlineInputBorder(borderSide: BorderSide(color: color, width: width));
  }),
)
```

## Text selection

There is another important aspect of `TextField` behavior, which is cursor and text selection style. It is regulated by the `textSelectionTheme` field of the `ThemeData` object:

```dart
MaterialApp(
  theme: ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.lightGreen,
      selectionColor: Colors.lime,
      selectionHandleColor: Colors.lightGreen,
    ),
  ),
  ...
)
```

## Your turn

1. Define global `inputDecorationTheme` using `InputDecorationTheme` with all customizations given above. Use `MaterialStateOutlineInputBorder` to define the `border` field value. Enter some text into input fields, switch between fields to see different UI when they are focused or not.
2. Define global `textSelectionTheme` using customizations given above. Select entered texts to see the effect.
