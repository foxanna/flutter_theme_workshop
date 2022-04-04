# Introduction

Welcome to the ***Consistent design with Flutter Theme*** workshop by [*Anna Leushchenko* 👩‍💻💙📱🇺🇦](https://github.com/foxanna)!

>Consistency is a winning strategy for a good application UI. And Flutter developers don’t have to be professional designers to achieve it. As usual, there is a widget for that - `Theme`! Find more details about effortless consistent Flutter application design in this workshop.

This workshop only assumes knowledge of commonly used Flutter material widgets like `Text`, `ElevatedButton`, `TextField`, etc., so everyone is welcomed!

## Contents

* Step 1. Introduction  
* Step 2. ThemeData  
* Step 3. Styling texts and icons  
* Step 4. Styling buttons  
* Step 5. Styling inputs  
* Step 6. Styling screens  
* Step 7. Conclusion


## Let's go!

Take a look at the `ExampleWidget` on the line `38` on the right. It consists of three similar `ElevatedButton`s placed in a `Column`:

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton(
      child: const Text('first'),
      onPressed: () {},
    ),
    ElevatedButton(
      child: const Text('second'),
      onPressed: () {},
    ),
    ElevatedButton(
      child: const Text('third'),
      onPressed: () {},
    ),
  ],
)
```

If you run the code snippet on the right, you will see three similarly-looking blue buttons with white text. 

To make UI more interesting, let's design a green button with yellow text:

```dart
ElevatedButton(
  child: const Text('example'),
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    primary: Colors.green,
    onPrimary: Colors.yellow,
  ),
)
```

To make this styling consistent across the application, such a style should be applied to every button, which would lead to code duplication. There are of course ways around it, like creating extensions or custom buttons. But we are here to talk about effortless UI consistency, which can be achieved with the `Theme` widget.

## Theme widget

The `Theme` widget applies a given `ThemeData`, which describes the colors and typographic choices of an application, to descendant widgets. 

Going back to the previous example, the `style` field value can be moved from the `ElevatedButton` widget up to the `ElevatedButtonThemeData`, which is a part of `ThemeData` provided to the `Theme` widget:

```dart
Theme(
  data: ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        onPrimary: Colors.yellow,
      ),
    ),
  ),
  child: ElevatedButton(
    child: const Text('example'),
    onPressed: () {},
  ),
)
```

The result is the same: a green button with yellow text. But now, when placed closer to the top of the widgets tree, this `Theme` widget can help to consistently style all buttons on the screen.

## Your turn

1. Apply the `Theme` from the code snippet above to the `ExampleWidget`. All three buttons should become green.
