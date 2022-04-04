# Styling inputs

## TextField widget

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
    color: Colors.orange,
  ),
  hintStyle: TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: 14.0,
  ),
  suffixIconColor: Colors.green,
  ...
)
```

`TextField` borders deserve a special attention. They are:

* `enabledBorder` - the border to display when the widget is enabled and is not showing an error;
* `focusedBorder` - the border to display when the widget has the focus and is not showing an error;
* `errorBorder` - the border to display when the widget does not have the focus and is showing an error;
* `focusedErrorBorder` - the border to display when the widget has the focus and is showing an error;
* `disabledBorder` - the border to display when the widget is disabled and is not showing an error;
* `border` - this property is only used when the appropriate one of the above is not specified.

These values default to `UnderlineInputBorder` which draws a horizontal line at the bottom of a widget. Let's define a custom set of borders using `UnderlineInputBorder` which draws a rounded rectangle around, green when enabled, red in case of error, and yellow when disabled:

```dart
InputDecorationTheme(
  ...
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 2)),
  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
)
```

## Text selection

There is another important aspect of `TextField` behavior, which is cursor and text selection style. It is regulated by the `textSelectionTheme` field of the `ThemeData` object:

```dart
MaterialApp(
  theme: ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.orange,
      selectionColor: Colors.yellow,
      selectionHandleColor: Colors.orange,
    ),
  ),
  ...
)
```

## Your turn

1. Define global `inputDecorationTheme` using customizations given above. Enter some text into input fields, switch between fields to see different UI when they are focused or not.
2. Define global `textSelectionTheme` using customizations given above. Select entered texts to see the effect.
