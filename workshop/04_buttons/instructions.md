# Styling buttons

## ElevatedButton widget

Earlier we saw how to customize some `ElevatedButton` style properties. `ElevatedButtonThemeData` object is created out of a `ButtonStyle`, and is provided to the global `ThemeData` configuration:

```dart
MaterialApp(
  theme: ThemeData.light().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        onPrimary: Colors.yellow,
      ),
    ),
  ),
  home: const ExamplePage(),
)
```

The `ButtonStyle` is the object that accommodates all button style settings. The `ElevatedButton.styleFrom()` is a static convenience method that constructs an elevated button style from simple values like `primary` for button background color and `onPrimary` for text and icon color. However, `ButtonStyle()` default constructor allows a more granular customization. To start with, let's repeat the style above:

```dart
ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
)
```

Both `backgroundColor` and `foregroundColor` fields are of type `MaterialStateProperty`, which represent values that depend on a widget's [material state](https://material.io/design/interaction/states.html). The `.all` constructor creates a `MaterialStateProperty` that resolves to the same value for any states set.

Now let's say the button should turn blue when hovered, and orange when pressed. For that, we'll use the `overlayColor` field of the same type `MaterialStateProperty`. This time, we are interested in different behavior depending on the button state. For that we'll use the `.resolveWith` constructor:

```dart
ButtonStyle(
  overlayColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered))
          return Colors.blue;
        if (states.contains(MaterialState.pressed))
          return Colors.orange;
        return null;
    }
  )
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

In the previous step of this workshop, it was mentioned that `ElevatedButton`, `TextButton`, and `OutlinedButton` widgets' text style can be customized globally by providing a value for `labelLarge` field of the global `TextTheme` object. In addition, `ButtonStyle` object exposes `textStyle` field for more granular customization. For example, let's change the font style to italic when the button is in a pressed state:

```dart
ButtonStyle(
  textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
    (states) => states.contains(MaterialState.pressed)
      ? TextStyle(fontStyle: FontStyle.italic)
      : null
  )
)
```

## OutlinedButton widget

Styling of the `OutlinedButton` is very similar to `ElevatedButton`. The `ThemeData` object exposes `outlinedButtonTheme` field of type `OutlinedButtonThemeData`, which is created out of a `ButtonStyle` object. Similarly, there is a static convenience method `OutlinedButton.styleFrom` that constructs an outlined button style from simple values:

```dart
MaterialApp(
  theme: ThemeData.light().copyWith(
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.red,
        side: const BorderSide(color: Colors.red, width: 2),
      )
    )
  ),
  home: const ExamplePage(),
)
```

And similarly, a `ButtonStyle` object can be created with the default `ButtonStyle` constructor, that allows more granular configuration:

```dart
ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
  side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.red, width: 2)),
  overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
    if (states.contains(MaterialState.hovered)) 
      return Colors.yellow.withOpacity(0.2);
    if (states.contains(MaterialState.pressed)) 
      return Colors.yellow;
    return null;
  }),
),
```

## TextButton widget

Everything mentioned above is valid for customizing `TextButton` style. The `ThemeData` object exposes `textButtonTheme` field of type `TextButtonThemeData`:

```dart
MaterialApp(
  theme: ThemeData.light().copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.orange,
      ),
    ),
  ),
  home: const ExamplePage(),
)
```

## Your turn

1. Define global `elevatedButtonTheme` using `ButtonStyle` default constructor, apply customizations provided above.
2. Define global `outlinedButtonTheme` using `ButtonStyle` default constructor, apply customizations provided above.
3. Customize global `textButtonTheme` using style obtained with `TextButton.styleFrom` method, apply customizations provided above.
