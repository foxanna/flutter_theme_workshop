# ThemeData

Actually, the main focus of this workshop is not on the `Theme` widget itself, but on the `ThemeData` object, which is passed to the `Theme` widget `data` field. `ThemeData` is a container that aggregates styles for all kinds of widgets.

Previously we saw how an `ElevatedButton` can be customized by specifying `elevatedButtonTheme` field:

```dart
Theme(
  data: ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.yellow,
      ),
    ),
  ),
  child: const ExampleWidget(),
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.yellow,
      ),
    ),
  ),
  child: const ExampleWidget(),
)
```

## Global ThemeData

In the example above the `ThemeData` configuration is applied only to a part of the widget tree wrapped with the `Theme` widget. Other parts of the screen or other screens are not styled in the same way. 

To make the styling consistent across the entire application, the  `MaterialApp` widget exposes a special `theme` field of `ThemeData` type. When set, the given `ThemeData` configuration is applied to all application screens:

```dart
MaterialApp(
  theme: ThemeData.light().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.yellow,
      ),
    ),
  ),
  home: const ExamplePage(),
)
```

In fact, under the hood, the `MaterialApp` widget passes the given `theme` value to the inner `Theme` widget, which wraps the application navigator.

It's worth mentioning that if no `theme` value is provided to `MaterialApp` widget, the default `ThemeData.light()` is used. That is why the three buttons were blue without any customization.

Additionally, the `MaterialApp` widget exposes `darkTheme` field, which is used to provide a dark version of the user interface. `themeMode` field controls which theme is used if a `darkTheme` is provided:

```dart
MaterialApp(
  theme: ...,
  darkTheme: ThemeData.dark(),
  themeMode: ThemeMode.dark,
  home: const ExamplePage(),
)
```

## Accessing ThemeData

No matter how a `ThemeData` was provided, either through `Theme` widget or through `MaterialApp`, it can be accessed from widgets below with:

```dart
ThemeData theme = Theme.of(context);
```

## Your turn

1. Remove `Theme` widget around `ExampleWidget`.
2. Instead, set the `theme` field of the `MaterialApp` to the predefined light theme. Customize buttons style with the help of `copyWith` method. All three buttons should remain red.
3. Set the `darkTheme` field of the `MaterialApp` to the predefined dark theme. Try different values for the `themeMode` field of the `MaterialApp`.
