# Styling buttons

## OutlinedButton widget

Styling of the `OutlinedButton` is very similar to `ElevatedButton`. The `ThemeData` object exposes `outlinedButtonTheme` field of type `OutlinedButtonThemeData`, which is created out of a `ButtonStyle` object. Similarly, there is a static convenience method `OutlinedButton.styleFrom` that constructs an outlined button style from simple values:

```dart
MaterialApp(
  theme: ThemeData(
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.green,
        side: BorderSide(color: Colors.green, width: 2),
      ),
    ),
  ),
  ...
)
```

And similarly, a `ButtonStyle` object can be created with the default `ButtonStyle` constructor, that allows more granular configuration:

```dart
ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
  side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.green, width: 2)),
  overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
    if (states.contains(MaterialState.hovered)) 
      return Colors.lime.withOpacity(0.2);
    if (states.contains(MaterialState.pressed)) 
      return Colors.lime.withOpacity(0.4);
    return null;
  }),
),
```

## TextButton widget

Everything mentioned above is valid for customizing `TextButton` style. The `ThemeData` object exposes `textButtonTheme` field of type `TextButtonThemeData`:

```dart
MaterialApp(
  theme: ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.lightGreen,
      ),
    ),
  ),
  ...
)
```

## Your turn

1. Define the global `outlinedButtonTheme` using the `ButtonStyle` default constructor, apply customizations of `foregroundColor`, `side`, and `overlayColor` provided above.
2. Customize the global `textButtonTheme` using the style obtained with `TextButton.styleFrom` method, apply customization of `primary` color provided above.
