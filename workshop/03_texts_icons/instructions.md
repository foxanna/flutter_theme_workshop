# Styling texts and icons

Though providing a `ColorScheme` is a powerful consistent way to style most of the application components, there might be the desire to tweak some widgets individually. This and the next workshop steps are dedicated to customizing some of the most used widgets.

## Text widget

The simplest `Text` widget usage looks like:

```dart
Text('example')
```

Typically, applications use a variety of text styles. Thus, `Text` widgets are usually explicitly customized with some text style: 

```dart
Text(
  'example',
  style: TextStyle(
    color: Colors.red,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.8,
    ...
  ),
)
```

Instead of configuring individual `Text` widget styles, the consistent design can be achieved by customizing a global set of text styles. The `TextTheme` object, containing definitions for the various typographical styles, can be provided to the global `ThemeData` object:

```dart
MaterialApp(
  theme: ThemeData(
    textTheme: TextTheme(...),
  ),
  ...
)
```

The `TextTheme` allows defining the following text styles:

```dart
TextTheme(
  displayLarge: TextStyle(...),
  displayMedium: TextStyle(...),
  displaySmall: TextStyle(...),
  headlineLarge: TextStyle(...),
  headlineMedium: TextStyle(...),
  headlineSmall: TextStyle(...),
  titleLarge: TextStyle(...),
  titleMedium: TextStyle(...),
  titleSmall: TextStyle(...),
  bodyLarge: TextStyle(...),
  bodyMedium: TextStyle(...),
  bodySmall: TextStyle(...),
  labelLarge: TextStyle(...),
  labelMedium: TextStyle(...),
  labelSmall: TextStyle(...),
)
```

However, describing all `TextStyle` fields of `TextTheme` is unnecessary. As with the `ThemeData` object, there are predefined `TextTheme` instances that implement the typography styles in the material design specification:

* `Typography().black` - a material design text theme with dark glyphs 
* `Typography().white` - a material design text theme with light glyphs

These should be used as a starting point and further customized with `copyWith` or `apply` methods:

```dart
ThemeData(
  textTheme: Typography().black
    .apply(
      displayColor: Colors.greenAccent,
      bodyColor: Colors.green,
    )
    .copyWith(
      displayLarge: TextStyle(
        color: Colors.lightGreen,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.8,
      ),
    ),
)
```

While the `copyWith` method creates a copy of this text theme but with the given fields replaced with the new values, the `apply` method creates a copy of this text theme but with the given field replaced in **each** of the individual text styles.

It's worth mentioning that by default, the `ThemeData` object already defines an instance of `TextTheme` with either dark or light glyphs depending on the `ThemeData` brightness.

Now, `TextStyle`s from above can be obtained with `Theme.of(context).textTheme` and provided to individual `Text` widgets:

```dart
Text(
  'example',
  style: Theme.of(context).textTheme.displayLarge,
)
```

If no explicit style is provided to a `Text` widget, it implicitly uses the `bodyMedium` style:

```dart
Text('bodyMedium')
```

In fact, providing global `TextTheme` is also a way to implicitly customize some other widgets. For example, `ElevatedButton`, `TextButton`, and `OutlinedButton` widgets by default use `labelLarge` text style, `titleLarge` style is used for `AlertDialog.title` and `AppBar.title`, etc.

<!-- This section feels a little out of place here, and unrelated to the rest of the content that proceeds it. Maybe move it to a short step by itself? -->

## Icon widget

The simplest `Icon` widget usage looks like:

```dart
Icon(Icons.account_circle)
```

It has a few fields to style individually: `size`, `color`. And the same fields can be customized globally through `IconThemeData` object:

```dart
MaterialApp(
  theme: ThemeData(
    iconTheme: IconThemeData(
      color: Colors.lime,
      size: 36.0,
    ),
  ),
  ...
)
```

## Your turn

1. Customize `TextTheme` globally. Use `Typography().black` instance and apply customizations with `.apply` and `.copyWith` methods.
2. Customize `IconThemeData` globally.
