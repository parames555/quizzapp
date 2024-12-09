import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialRadius {
  double xs, small, medium, large;

  MaterialRadius(
      {this.xs = 2, this.small = 4, this.medium = 6, this.large = 8});
}

class ColorGroup {
  final Color color, onColor;

  ColorGroup(this.color, this.onColor);
}

class AppTheme {
  static TextDirection textDirection = TextDirection.ltr;

  static Color primaryColor = const Color(0xFF750537);

  /// -------------------------- Light Theme  -------------------------------------------- ///

  static final ThemeData lightTheme = ThemeData(
    /// Brightness
    brightness: Brightness.light,
    useMaterial3: false,

    /// Primary Color
    primaryColor: AppTheme.primaryColor,

    /// Scaffold and Background color
    scaffoldBackgroundColor: const Color(0xffF5F5F5),
    canvasColor: Colors.transparent,

    /// AppBar Theme
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffF5F5F5),
        iconTheme: IconThemeData(color: Color(0xff495057)),
        actionsIconTheme: IconThemeData(color: Color(0xff495057))),

    /// Card Theme
    cardTheme: const CardTheme(color: Color(0xffffffff)),
    cardColor: const Color(0xffffffff),

    /// Colorscheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff006a64),
      // seedColor: Color(0xe364523c),
      brightness: Brightness.light,
    ),

    snackBarTheme: const SnackBarThemeData(actionTextColor: Colors.white),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppTheme.primaryColor,
        splashColor: const Color(0xffeeeeee).withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: AppTheme.primaryColor,
        hoverColor: AppTheme.primaryColor,
        foregroundColor: const Color(0xffeeeeee)),

    /// Divider Theme
    dividerTheme:
        const DividerThemeData(color: Color(0xffdddddd), thickness: 1),
    dividerColor: const Color(0xffdddddd),

    /// Bottom AppBar Theme
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xffeeeeee), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: const Color(0xff495057),
      labelColor: AppTheme.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppTheme.primaryColor, width: 2.0),
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: AppTheme.primaryColor,
      inactiveTrackColor: AppTheme.primaryColor.withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: AppTheme.primaryColor,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Color(0xffeeeeee),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      checkColor: WidgetStateProperty.all(const Color(0xffffffff)),
      fillColor: WidgetStateProperty.all(AppTheme.primaryColor),
    ),
    switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? AppTheme.primaryColor
                : Colors.white)),

    /// Other Colors
    splashColor: Colors.white.withAlpha(100),
    indicatorColor: const Color(0xffeeeeee),
    highlightColor: const Color(0xffeeeeee),

    textTheme: TextTheme(
      displaySmall: GoogleFonts.nunito(), // Use Google Fonts
      displayLarge: GoogleFonts.nunito(),
      displayMedium: GoogleFonts.nunito(),
      headlineMedium: GoogleFonts.nunito(),
      headlineSmall: GoogleFonts.nunito(),
      titleLarge: GoogleFonts.nunito(),
      bodyLarge: GoogleFonts.nunito(fontSize: 18),
      bodyMedium: GoogleFonts.nunito(),
      titleMedium: GoogleFonts.nunito(),
      titleSmall: GoogleFonts.nunito(),
    ),
  );
}
