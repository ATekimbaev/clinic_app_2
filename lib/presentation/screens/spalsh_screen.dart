import 'package:clinic_app/core/app_consts.dart';
import 'package:clinic_app/presentation/screens/auth/welcome_screen.dart';
import 'package:clinic_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    routing();
    super.initState();
  }

  void routing() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogined = prefs.getBool(AppConsts.isLogined) ?? false;
    // await Future.delayed(
    //   const Duration(seconds: 2),
    // );
    if (isLogined) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (contex) => const HomeScreen(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (contex) => const WelcomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
