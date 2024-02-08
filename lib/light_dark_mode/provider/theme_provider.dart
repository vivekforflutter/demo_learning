import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,


    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
      appBarTheme: const AppBarTheme(
          color: Colors.red
      ),cardColor: Colors.orangeAccent
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,

    iconTheme: const IconThemeData(color: Colors.red, opacity: 0.8),
    appBarTheme: const AppBarTheme(
      color: Colors.green
    ),
    cardColor: Colors.cyan
  );
}