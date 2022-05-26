import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'extensions.dart';

class AppTheme {
  static const seedColor = Color(0xFF6750A4);
  static ColorScheme colorsFrom(Color seedColor, {Brightness brightness = Brightness.light}) {
    return ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness);
  }

  static ThemeData themeDataFrom(ColorScheme colors) {
    final brightness = colors.brightness;
    final textTheme = GoogleFonts.poppinsTextTheme(
      const TextTheme().apply(bodyColor: brightness.contrastColor()),
    );
    return ThemeData(
      brightness: colors.brightness,
      useMaterial3: true,
      dialogTheme: DialogTheme(backgroundColor: colors.background),
      splashFactory: InkRipple.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
      ),
      canvasColor: colors.background,
      disabledColor: colors.onSurface.withOpacity(.38),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.surfaceVariant,
        selectedItemColor: colors.onSurface,
        unselectedItemColor: colors.onSurfaceVariant,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: colors.surface),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.secondary,
        selectionColor: colors.secondary,
        selectionHandleColor: colors.secondary,
      ),
      scaffoldBackgroundColor: colors.background,
      toggleableActiveColor: colors.secondary,
      buttonTheme: ButtonThemeData(buttonColor: colors.primary),
      cardTheme: const CardTheme(clipBehavior: Clip.antiAlias),
      primaryTextTheme: textTheme,
      textTheme: textTheme,
      listTileTheme: ListTileThemeData(selectedColor: colors.secondary),
      tabBarTheme: TabBarTheme(
        labelColor: colors.secondary,
        unselectedLabelColor: colors.onSurfaceVariant,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colors.secondary,
              width: 2,
            ),
          ),
        ),
      ),
      colorScheme: colors,
      indicatorColor: colors.primary,
    );
  }

  static ThemeData darkTheme({
    Color? seedColor,
    ColorScheme? colors,
  }) =>
      themeDataFrom(
        colors ?? colorsFrom(seedColor ?? AppTheme.seedColor, brightness: Brightness.dark),
      );

  static ThemeData lightTheme({
    Color? seedColor,
    ColorScheme? colors,
  }) =>
      themeDataFrom(
        colors ?? colorsFrom(seedColor ?? AppTheme.seedColor),
      );
}
