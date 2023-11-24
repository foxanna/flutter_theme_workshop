# Introduction

Welcome to the ***Consistent design with Flutter Theme*** workshop by [*Anna Leushchenko* 👩‍💻💙📱🇺🇦](https://github.com/foxanna)!

>Consistency is a winning strategy for a good application UI. And Flutter developers don’t have to be professional designers to achieve it. As usual, there is a widget for that - `Theme`! Find more details about effortless consistent Flutter application design in this workshop.

This workshop only assumes knowledge of commonly used Flutter material widgets like `Text`, `ElevatedButton`, `TextField`, etc., so everyone is welcomed!

## Contents

* Step 1. Introduction  
* Step 2 & 3. ThemeData  
* Step 4. Styling icons  
* Step 5. Styling texts  
* Step 6 & 7. Styling buttons  
* Step 8. Styling inputs  
* Step 9. Styling screens  
* Step 10. Conclusion  

## About author

[*Anna Leushchenko* 👩‍💻💙📱🇺🇦](https://github.com/foxanna) is a mobile development expert, passionate about quality software, focused on Flutter. Anna is a Google Developer Expert in Dart and Flutter, conference speaker and tech writer, mentor and OSS contributor. Senior Staff Mobile Engineer at [*Tide*](https://www.tide.co/careers/).

## Let's go!

Take a look at the code snippet on the right. `ExampleApp` is a `MaterialApp` with `ExamplePage` as `home` page. `ExamplePage` consists of a `Scaffold` with an `AppBar` and `ExampleWidget` as `body`. This widgets structure will remain the same over the span of this workshop, but the content inside the `ExampleWidget` will change from step to step.

To start with, `ExampleWidget` consists of three similar `ElevatedButton` widgets placed in a `Column`:

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton(child: Text('first'), onPressed: () {}),
    ElevatedButton(child: Text('second'), onPressed: () {}),
    ElevatedButton(child: Text('third'), onPressed: () {}),
  ],
)
```

Run the code snippet on the right. You will see three similarly-looking pale purple (blue in pre-Material3 theme) buttons with deep purple text. 

To make UI more interesting, let's design a lime button with blue text:

```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.lime,
    foregroundColor: Colors.blue,
  ),
  ...
)
```

To make this styling consistent across the application, such a style should be applied to every button, which would lead to code duplication. There are of course ways around it, like creating extensions or custom buttons. But this workshop is about effortless UI consistency, which can be achieved with the `Theme` widget.

## Theme widget

The `Theme` widget applies a given `ThemeData`, which describes the colors and typographic choices of an application, to descendant widgets. 

Going back to the previous example, the `style` field value can be moved from the `ElevatedButton` widget up to the `ElevatedButtonThemeData`, which is a part of `ThemeData` provided to the `Theme` widget:

```dart
Theme(
  data: ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lime,
        foregroundColor: Colors.blue,
      ),
    ),
  ),
  child: ElevatedButton(...),
)
```

The result is the same: a lime button with blue text. But now, when placed closer to the top of the widgets tree, this `Theme` widget can help to consistently style all buttons on the screen.

## Your turn

1. Apply the `Theme` from the code snippet above to the `ExampleWidget`. All three buttons should become lime<img alt="Google Analytics" src="https://www.google-analytics.com/collect?v=1&cid=1&t=pageview&ec=workshop&ea=open&dp=step01&tid=UA-227136526-1" style="width: 1px; height: 1px"/>.
