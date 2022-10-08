import 'package:flutter/material.dart';

const Color darkBackground = Color(0xff1b1b1e);
const Color lightBackground = Color(0xfffefbfe);
ThemeData lightTheme = ThemeData.from(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: lightBackground,
    primarySwatch: getMaterialColorFromColor(const Color(0xff486598)),
    brightness: Brightness.light,
  ),
);

ThemeData darkTheme = ThemeData.from(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: darkBackground,
    primarySwatch: getMaterialColorFromColor(const Color(0xffa7c2fb)),
    brightness: Brightness.dark,
  ),
);

MaterialColor getMaterialColorFromColor(Color color) {
  Map<int, Color> colorShades = {
    50: getShade(color, value: 0.5),
    100: getShade(color, value: 0.4),
    200: getShade(color, value: 0.3),
    300: getShade(color, value: 0.2),
    400: getShade(color, value: 0.1),
    500: color,
    600: getShade(color, value: 0.1, darker: true),
    700: getShade(color, value: 0.15, darker: true),
    800: getShade(color, value: 0.2, darker: true),
    900: getShade(color, value: 0.25, darker: true),
  };
  return MaterialColor(color.value, colorShades);
}

Color getShade(Color color, {bool darker = false, double value = .1}) {
  assert(value >= 0 && value <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0));

  return hslDark.toColor();
}
