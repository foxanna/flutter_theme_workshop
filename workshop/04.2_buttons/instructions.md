# Styling buttons

## OutlinedButton style

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
  foregroundColor: MaterialStateProperty.all(Colors.green),
  side: MaterialStateProperty.all(BorderSide(color: Colors.green, width: 2)),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.hovered))
      return Colors.greenAccent;
    if (states.contains(MaterialState.pressed))
      return Colors.lightGreenAccent;
    return null;
  }),
  textStyle: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed)
        ? TextStyle(fontWeight: FontWeight.bold)
        : null;
  }),
),
```

## Reusing MaterialStateProperty

Have you noticed that in the code snippet above the `overlayColor` and `textStyle` values are exactly the same as for the `ElevatedButton` from the previous workshop step? It may happen that different widget types are required to have the same styling of some UI aspects and thus should share the same `MaterialStateProperty` logic. To make the implementation easy and consistent, inheritors of `MaterialStateProperty` can be declared:

```dart
class ButtonOverlayColor implements MaterialStateProperty<Color?> {
  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) 
      return Colors.greenAccent;
    if (states.contains(MaterialState.pressed)) 
      return Colors.lightGreenAccent;
    return null;
  }
}
```
```dart
class ButtonTextStyle implements MaterialStateProperty<TextStyle?> {
  @override
  TextStyle? resolve(Set<MaterialState> states) {
    return states.contains(MaterialState.pressed)
        ? TextStyle(fontWeight: FontWeight.bold)
        : null;
  }
}
```

And used in multiple styles:

```dart
ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      overlayColor: ButtonOverlayColor(),
      textStyle: ButtonTextStyle(),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      overlayColor: ButtonOverlayColor(),
      textStyle: ButtonTextStyle(),
    ),
  ),
)
```

## TextButton style

Everything mentioned above is valid for customizing `TextButton` style. The `ThemeData` object exposes `textButtonTheme` field of type `TextButtonThemeData`, which can be created out of `ButtonStyle` instance:

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

1. Declare `ButtonOverlayColor` and `ButtonTextStyle` classes to reuse their `MaterialStateProperty` logic in multiple styles.
2. Update the `ElevatedButtonThemeData` fields: `overlayColor` to a `ButtonOverlayColor` instance, `textStyle` to a `ButtonTextStyle` instance.
3. Define the global `outlinedButtonTheme` with the `style` created using `ButtonStyle()` default constructor. Apply customizations of `foregroundColor` and `side` fields provided above.  Set `overlayColor` and `textStyle` field values the same way as `ElevatedButtonThemeData` fields.  
4. Customize the global `textButtonTheme` using the `style` obtained with `TextButton.styleFrom` method, apply customization of `primary` color provided above.
