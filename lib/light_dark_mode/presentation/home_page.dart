import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_test/light_dark_mode/presentation/login_screen.dart';
import 'package:theme_test/light_dark_mode/provider/theme_provider.dart';
import '../../localization/localization_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var languageSelected = 0;
  var selectedLanguage;
  var langvalue;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text("Theme"),
        actions: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  _signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text("Logout"),
              ),
              // ChangeThemeButtonWidget(),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // Text(
            //   getTranslatedValues("get_started").toString(),
            //   style: const TextStyle(
            //     fontSize: 32,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            CircleAvatar(
              backgroundColor: Theme.of(context).iconTheme.color,
              child: const Icon(Icons.accessibility_new_outlined),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).cardColor,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (user != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email: ${user.email ?? "No email"}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Name: ${user.displayName ?? "No email"}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  const Icon(Icons.access_alarms),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///logout
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User logged out successfully");
    } catch (e) {
      print("Error logging out: $e");
    }
  }
}
