# Styling buttons

Check the code snippet on the right. The `ExampleWidget` content changed to buttons of different types.

## ElevatedButton style

Earlier you saw how to customize some `ElevatedButton` style properties. `ElevatedButtonThemeData` object is created out of a `ButtonStyle`, and is provided to the global `ThemeData` configuration:

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

## ButtonStyle

The `ButtonStyle` is the object that accommodates all button style settings. The `ElevatedButton.styleFrom()` is a static convenience method that constructs an `ElevatedButton` style from simple values like `primary` for button background color and `onPrimary` for text and icon color of type `Color`. However, `ButtonStyle()` default constructor allows a more granular customization, because all of its parameters are of type `MaterialStateProperty<T>`:

```dart
ButtonStyle(
  MaterialStateProperty<TextStyle?>? textStyle,
  MaterialStateProperty<Color?>? backgroundColor,
  MaterialStateProperty<Color?>? foregroundColor,
  MaterialStateProperty<Color?>? overlayColor,
  ...
)
```

## MaterialStateProperty

Some interactive material widgets like buttons or text inputs when receiving input from the user can be characterized by zero or more [*material states*](https://material.io/design/interaction/states.html). The `MaterialState` is an enum representing such states:

* `hovered` - when the user moves their mouse cursor over a given widget
* `focused` - when the user navigates with the keyboard to a given widget
* `pressed` - when the user is actively tapping or clicking on a given widget
* `dragged` - when the user moves a given widget from one place to another
* `selected` - when a given widget has been toggled on, such as a checkbox or radio button
* `scrolledUnder` - when a given widget overlaps the content of a scrollable below
* `disabled` - when a given widget cannot be interacted with
* `error` - when a given widget has entered some form of invalid state

The `MaterialStateProperty<T>` is an interface for classes that resolve to a value of type `T` based on a widget's interactive states set. It's easier to understand by looking at the example. 

Let's say the button should have an overlay of different shades of green when hovered and pressed. It means, the `overlayColor` field of type `MaterialStateProperty<Color?>` should resolve to different `Color` values based on the content of the `Set<MaterialState> states` parameter:

```dart
ButtonStyle(
  overlayColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.hovered))
      return Colors.greenAccent;
    if (states.contains(MaterialState.pressed))
      return Colors.lightGreenAccent;
    return null;
  }),
)
```

At the same time, a button should always have lime background and blue text. It means the `backgroundColor` and `foregroundColor` fields of type `MaterialStateProperty<Color?>` should resolve to a single value for all states:

```dart
ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.lime),
  foregroundColor: MaterialStateProperty.all(Colors.blue),
)
```

## Text style

In the previous step of this workshop, it was mentioned that `ElevatedButton`, `TextButton`, and `OutlinedButton` widgets' text style can be customized globally by providing a value for `labelLarge` field of the global `TextTheme` object. In addition, `ButtonStyle` object exposes `textStyle` field for more granular customization. For example, this code changes the font weight to bold when the button is in a pressed state:

```dart
ButtonStyle(
  textStyle: MaterialStateProperty.resolveWith((states) => 
    states.contains(MaterialState.pressed)
      ? TextStyle(fontWeight: FontWeight.bold)
      : null
  ),
)
```

## Your turn

1. Customize the global theme `elevatedButtonTheme` field with `ElevatedButtonThemeData` object. Create its `style` using `ButtonStyle()` default constructor. Apply customizations of `backgroundColor`, `foregroundColor`, `overlayColor`, and `textStyle` provided above.
