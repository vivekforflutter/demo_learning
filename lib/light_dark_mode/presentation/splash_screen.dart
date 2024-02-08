import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theme_test/light_dark_mode/presentation/home_page.dart';
import 'package:theme_test/light_dark_mode/presentation/login_screen.dart';
import '../../session_manager/session_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var selectedLanguage;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      User? user = _auth.currentUser;

      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        print("User is logged in: ${user.email}");
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
        print("User is not logged in");
      }
    });
    getUserType();
    super.initState();
  }

  void getUserType() async {
    selectedLanguage =
        await SessionManager().getString(SessionManager.LANGUAGE);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Welcome")));
  }
}
