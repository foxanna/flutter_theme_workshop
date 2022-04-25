# Global ThemeData

In the previous workshop steps the `ThemeData` configuration was applied only to a part of the widget tree wrapped with the `Theme` widget. Other parts of the screen or other screens were not styled in the same way. 

To make the styling consistent across the entire application, the `MaterialApp` widget exposes a special `theme` field of `ThemeData` type. When set, the given `ThemeData` configuration is applied to all application screens:

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    elevatedButtonTheme: ElevatedButtonThemeData(...),
  ),
  home: ExamplePage(),
)
```

In fact, under the hood, the `MaterialApp` widget passes the given `theme` value to the inner `Theme` widget, which wraps all application screens.

It's worth mentioning that if no `theme` value is provided to `MaterialApp` widget, the default `ThemeData.light()` is used. That is why the three buttons were blue without any customization.

## Dark theme

Additionally, the `MaterialApp` widget exposes `darkTheme` field, which is used to provide a dark version of the user interface. The `themeMode` field controls which theme is used if a `darkTheme` is provided:

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

1. Copy the `data` field value from the `Theme` widget into the `theme` field of the `MaterialApp`. The `AppBar` background color should change to green.
2. Remove `Theme` widget around `ExampleWidget`. All three buttons should remain lime.
3. Set the `darkTheme` field of the `MaterialApp` to the predefined dark theme. Try different values for the `themeMode` field<img alt="Google Analytics" src="https://www.google-analytics.com/collect?v=1&cid=1&t=pageview&ec=workshop&ea=open&dp=step03&tid=UA-227136526-1" style="width: 1px; height: 1px"/>.
