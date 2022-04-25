# Styling texts

Check the code snippet on the right. The `ExampleWidget` content changed to `Text` widgets with different styles.

## Text style

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

## TextTheme

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

However, describing all `TextStyle` fields of `TextTheme` is unnecessary. As with the `ThemeData` object, there are predefined `TextTheme` instances that implement the typography styles in the material design specification.

## Predefined TextTheme

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

## Using TextTheme

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

## Your turn

1. Customize `TextTheme` globally with the `Typography().black` instance.
2. Apply customizations with `.apply` and `.copyWith` methods<img alt="Google Analytics" src="https://www.google-analytics.com/collect?v=1&cid=1&t=pageview&ec=workshop&ea=open&dp=step05&tid=UA-227136526-1" style="width: 1px; height: 1px"/>.
