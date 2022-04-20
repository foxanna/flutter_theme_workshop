# ThemeData

Actually, the main focus of this workshop is not on the `Theme` widget itself, but on the `ThemeData` object, which is passed to the `Theme` widget `data` field. `ThemeData` is a container that aggregates styles for all kinds of widgets.

Previously you saw how an `ElevatedButton` can be customized by specifying `elevatedButtonTheme` field:

```dart
Theme(
  data: ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.lime,
        onPrimary: Colors.blue,
      ),
    ),
  ),
  child: ExampleWidget(),
)
```

The `ThemeData` class constructor accepts over 70 parameters dedicated to customizing color palette, typography, and components. In the next steps of this workshop you will take a deeper look into these fields:

```dart
ThemeData(
  colorScheme: ColorScheme(...),
  iconTheme: IconThemeData(...),
  textTheme: TextTheme(...),
  elevatedButtonTheme: ElevatedButtonThemeData(...),
  outlinedButtonTheme: OutlinedButtonThemeData(...),
  textButtonTheme: TextButtonThemeData(...),
  inputDecorationTheme: InputDecorationTheme(...),
  textSelectionTheme: TextSelectionThemeData(...),
  appBarTheme: AppBarTheme(...), 
  scaffoldBackgroundColor: Color(...),
)
```

## Predefined ThemeData

Obviously, specifying values for all `ThemeData` fields would be tedious. There are additional constructors for obtaining a well-made predefined collections of styles:

* `ThemeData.light()` returns a default light blue theme
* `ThemeData.dark()` returns a default dark teal theme

They can be used as a basis for a good application design, and can be further customized with `copyWith` method:

```dart
Theme(
  data: ThemeData.light().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(...),
  ),
  ...
)
```

## Generating ThemeData

The `ColorScheme` is a set of colors
based on the [*Material spec*](https://m3.material.io/styles/color/the-color-system/color-roles) that can be used to configure the color properties of most components. It is a powerful tool to consistently customize application colors with a well-made color palette. 

One way to initialize a `ThemeData` object with a `ColorScheme` is to provide the `colorSchemeSeed` field and the `brightness`. A generated color scheme will be based on the tones of `colorSchemeSeed` color and all of its contrasting colors will meet accessibility guidelines for readability:

```dart
Theme(
  data: ThemeData(
    colorSchemeSeed: Colors.green, 
    brightness: Brightness.light,
  ),
  ...
)
```

The `Brightness.light` is the default one if the `brightness` field value was not specified.

If you want to customize a generated color scheme, you can use
`ColorScheme.fromSeed` and then override any colors that need to be replaced directly or with `copyWith` method:

```dart
Theme(
  data: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      onPrimary: Colors.yellow,
    ).copyWith(...),
  ),
  ...
)
```

## Your turn

1. Provide `colorScheme` field to the `ThemeData` constructor. Use `ColorScheme.fromSeed` constructor with `Colors.green` color. Run the app.
2. Remove the `elevatedButtonTheme`. Run the code again! What is the difference?

<!-- Reviewers note: By providing a colorScheme without removing 
`elevatedButtonTheme` the user sees no difference. I'm not sure if removing the
 elevatedButtonTheme is an exercise you want the reader to solve. If that's the
  case, no need for any changes :) -->
