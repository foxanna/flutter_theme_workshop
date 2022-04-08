# ThemeData

Actually, the main focus of this workshop is not on the `Theme` widget itself, but on the `ThemeData` object, which is passed to the `Theme` widget `data` field. `ThemeData` is a container that aggregates styles for all kinds of widgets.

Previously we saw how an `ElevatedButton` can be customized by specifying `elevatedButtonTheme` field:

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

The `ThemeData` class constructor accepts over 70 parameters dedicated to customizing color palette, typography, and components. In next steps of this workshop we'll take a deeper look into these fields:

```dart
ThemeData(
  textTheme: TextTheme(...),
  iconTheme: IconThemeData(...),
  elevatedButtonTheme: ElevatedButtonThemeData(...),
  outlinedButtonTheme: OutlinedButtonThemeData(...),
  textButtonTheme: TextButtonThemeData(...),
  inputDecorationTheme: InputDecorationTheme(...),
  textSelectionTheme: TextSelectionThemeData(...),
  appBarTheme: AppBarTheme(...), 
  scaffoldBackgroundColor: Color(...),
  ...
)
```

## Predefined ThemeData

Obviously, specifying values for all `ThemeData` fields would be a tedious work. There are additional constructors for obtaining a well-made predefined collections of styles:

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

## Global ThemeData

In the previous workshop step the `ThemeData` configuration was applied only to a part of the widget tree wrapped with the `Theme` widget. Other parts of the screen or other screens were not styled in the same way. 

To make the styling consistent across the entire application, the  `MaterialApp` widget exposes a special `theme` field of `ThemeData` type. When set, the given `ThemeData` configuration is applied to all application screens:

```dart
MaterialApp(
  theme: ThemeData(
    colorSchemeSeed: Colors.green,
    elevatedButtonTheme: ElevatedButtonThemeData(...),
  ),
  home: ExamplePage(),
)
```

In fact, under the hood, the `MaterialApp` widget passes the given `theme` value to the inner `Theme` widget, which wraps all application screens.

It's worth mentioning that if no `theme` value is provided to `MaterialApp` widget, the default `ThemeData.light()` is used. That is why the three buttons were blue without any customization.

## Dark theme

Additionally, the `MaterialApp` widget exposes `darkTheme` field, which is used to provide a dark version of the user interface. `themeMode` field controls which theme is used if a `darkTheme` is provided:

```dart
MaterialApp(
  darkTheme: ThemeData.dark(),
  themeMode: ThemeMode.dark,
  ...
)
```

## Accessing ThemeData

No matter how a `ThemeData` was provided, either through the `Theme` widget or through the `MaterialApp`, it can be accessed from the widgets below with:

```dart
ThemeData theme = Theme.of(context);
```

## Your turn

1. Remove `Theme` widget around `ExampleWidget`.
2. Instead, set the `theme` field of the `MaterialApp` to the  light theme created with `colorSchemeSeed` field, customize buttons style. All three buttons should remain lime.
3. Set the `darkTheme` field of the `MaterialApp` to the predefined dark theme. Try different values for the `themeMode` field of the `MaterialApp`.
