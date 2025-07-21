import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/values/values.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: colorScheme.onBackground),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      focusColor: focusColor,
      useMaterial3: true,
    );
  }

  static final ColorScheme lightColorScheme = const ColorScheme(
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.black,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF241E30),
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static final ColorScheme darkColorScheme = const ColorScheme(
    primary: AppColors.primaryColor,
    onPrimary: Colors.black,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    background: Color(0xFF121212),
    onBackground: Colors.white,
    surface: Color(0xFF1E1E1E),
    onSurface: Colors.white,
    error: Colors.red,
    onError: Colors.black,
    brightness: Brightness.dark,
  );

  static const _bold = FontWeight.w700;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.gloriaHallelujah(
      fontSize: Sizes.TEXT_SIZE_96,
      color: AppColors.black,
      fontWeight: _bold,
    ),
    displayMedium: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_60,
      color: AppColors.black,
      fontWeight: _bold,
    ),
    displaySmall: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_48,
      color: AppColors.black,
      fontWeight: _bold,
    ),
    headlineLarge: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_34,
      color: AppColors.black,
      fontWeight: _bold,
    ),
    headlineMedium: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_24,
      color: AppColors.black,
      fontWeight: _bold,
    ),
    headlineSmall: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_20,
      color: AppColors.black,
      fontWeight: _bold,
    ),
    titleLarge: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.black,
      fontWeight: _bold,
    ),
    titleMedium: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.black,
      fontWeight: _bold,
    ),
    bodyLarge: GoogleFonts.lato(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.primaryText2,
      fontWeight: _regular,
    ),
    bodyMedium: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.black,
      fontWeight: _light,
    ),
    labelLarge: GoogleFonts.lato(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.black,
      fontWeight: _regular,
    ),
    bodySmall: GoogleFonts.ibmPlexMono(
      fontSize: Sizes.TEXT_SIZE_12,
      color: AppColors.primaryText1,
      fontWeight: _regular,
    ),
  );
}

// | Material 2 (`TextTheme`) | Material 3 (`TextTheme`)    | Uso típico                        |
// | ------------------------ | --------------------------- | --------------------------------- |
// | `headline1`              | `displayLarge`              | Títulos grandes tipo portada      |
// | `headline2`              | `displayMedium`             | Títulos principales               |
// | `headline3`              | `displaySmall`              | Subtítulos grandes                |
// | `headline4`              | `headlineLarge`             | Encabezado de sección             |
// | `headline5`              | `headlineMedium`            | Título de página / pantalla       |
// | `headline6`              | `headlineSmall`             | Título en tarjetas o widgets      |
// | `subtitle1`              | `titleLarge`                | Subtítulos más destacados         |
// | `subtitle2`              | `titleMedium`               | Subtítulos más pequeños           |
// | `bodyText1`              | `bodyLarge`                 | Texto principal / párrafos        |
// | `bodyText2`              | `bodyMedium`                | Texto secundario o de apoyo       |
// | `caption`                | `bodySmall`                 | Notas, descripciones pequeñas     |
// | `button`                 | `labelLarge`                | Texto en botones                  |
// | *(nuevo)*                | `labelMedium`, `labelSmall` | Etiquetas pequeñas, chips, inputs |
