# Styling icons

Though providing a `ColorScheme` is a powerful consistent way to style most of the application components, there might be the desire to tweak some widgets individually. This and the next workshop steps are dedicated to customizing some of the most used widgets.

Check the code snippet on the right. The `ExampleWidget` content changed to `Icon` and `IconButton` widgets.

## Icon style

The `Icon` widget exposes several fields that control its style: 

```dart
Icon(
  Icons.email,
  color: Colors.lime,
  size: 36.0,
  opacity: 0.5,
)
```

They can be customized individually for each `Icon`, but typically all application icons have the same look. To reach the icons 
design consistency, meet the `IconThemeData`.

## IconThemeData

`IconThemeData` is an object similar to the `ThemeData` but dedicated to styling icons. And the `IconTheme` widget is an analog of the `Theme` widget, but again, dedicated to styling icons only, so its `data` field type is `IconThemeData`:

```dart
IconTheme(
  data: IconThemeData(
    color: Colors.lime,
    size: 36.0,
    opacity: 0.5,
  ),
  child: Icon(Icons.email),
)
```

Similarly, the icons style can be customized globally through `iconTheme` field of the `ThemeData` object:

```dart
MaterialApp(
  theme: ThemeData(
    iconTheme: IconThemeData(
      color: Colors.lime,
      size: 36.0,
      opacity: 0.5,
    ),
  ),
  ...
)
```

With this change, all application icons would become lime and half-transparent.

## IconButton style

`Icon` widgets are not interactive. For interactive icons, Flutter has a dedicated `IconButton` widget. The above customization also affects the look of `IconButton` widgets, so any button like this would also become lime:

```dart
IconButton(
  icon: Icon(Icons.language), 
  onPressed: () {},
)
```

## AppBar Icon style

By default, customizations of the global theme `iconTheme` field also affect `IconButton` widgets inside the `AppBar`, except for their `color`. With global `iconTheme` customized as above, any button like this would be half-transparent and of size `36`:

```dart
AppBar(
  actions: [
    IconButton(
      icon: Icon(Icons.account_circle), 
      onPressed: () {}
    ),
  ],
)
```

Next steps of this workshop show how to customize icons located in the `AppBar` more precisely.

## Your turn

1. Customize global `iconTheme`. The email and globe icons should become lime and half-transparent. The account icon in the top corner should become half-transparent.
