# Styling buttons

## ElevatedButton widget

Earlier we saw how to customize some `ElevatedButton` style properties. `ElevatedButtonThemeData` object is created out of a `ButtonStyle`, and is provided to the global `ThemeData` configuration:

```dart
MaterialApp(
  theme: ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.lime,
        onPrimary: Colors.blue,
      ),
    ),
  ),
  ...
)
```

The `ButtonStyle` is the object that accommodates all button style settings. The `ElevatedButton.styleFrom()` is a static convenience method that constructs an elevated button style from simple values like `primary` for button background color and `onPrimary` for text and icon color. However, `ButtonStyle()` default constructor allows a more granular customization. To start with, let's repeat the style above:

```dart
ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.lime),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
)
```

Both `backgroundColor` and `foregroundColor` fields are of type `MaterialStateProperty`, which represent values that depend on a widget's [*material state*](https://material.io/design/interaction/states.html). The `.all` constructor creates a `MaterialStateProperty` that resolves to the same value for any states set.

Now let's say the button should be of different shades of green when hovered and pressed. For that, we'll use the `overlayColor` field of the same type `MaterialStateProperty`. This time, we are interested in different behavior depending on the button state. For that we'll use the `.resolveWith` constructor:

```dart
ButtonStyle(
  overlayColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered))
          return Colors.greenAccent;
        if (states.contains(MaterialState.pressed))
          return Colors.lightGreenAccent;
        return null;
    }
  ),
)
```

It accepts a `MaterialPropertyResolver` callback that receives a `Set<MaterialState> states` and returns a `Color` if a specific condition is met, or `null` to defer to the widget's default. The `states` set can contain zero or more of `MaterialState`:

```dart
enum MaterialState {
  hovered,
  focused,
  pressed,
  dragged,
  selected,
  scrolledUnder,
  disabled,
  error,
}
```

In the previous step of this workshop, it was mentioned that `ElevatedButton`, `TextButton`, and `OutlinedButton` widgets' text style can be customized globally by providing a value for `labelLarge` field of the global `TextTheme` object. In addition, `ButtonStyle` object exposes `textStyle` field for more granular customization. For example, let's change the font weight to bold when the button is in a pressed state:

```dart
ButtonStyle(
  textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
    (states) => states.contains(MaterialState.pressed)
      ? TextStyle(fontWeight: FontWeight.bold)
      : null
  ),
)
```

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

1. Define global `elevatedButtonTheme` using `ButtonStyle` default constructor, apply customizations provided above.
2. Define global `outlinedButtonTheme` using `ButtonStyle` default constructor, apply customizations provided above.
3. Customize global `textButtonTheme` using style obtained with `TextButton.styleFrom` method, apply customizations provided above.
