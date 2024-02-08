import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:theme_test/light_dark_mode/provider/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:theme_test/localization/localization.dart';
import 'firebase_options.dart';
import 'light_dark_mode/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Light & Dark Theme';

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.changeLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en');


  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override


  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: const [
              Locale('en', 'US'), // English, no country code
              Locale('th', ''),
            ],
            localizationsDelegates: const [
              DemoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: _locale,
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (locale.languageCode == deviceLocale?.languageCode &&
                    locale.countryCode == deviceLocale?.countryCode) {
                  return locale;
                  // return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            title: MyApp.title,
            // themeMode: themeProvider.themeMode,
            themeMode: ThemeMode.system,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: const SplashScreen(),
          );
        },
      );
}
