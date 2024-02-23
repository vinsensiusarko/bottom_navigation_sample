import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/login_page.dart';
import 'main/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  String? token;
  late Animation<double> opacity;
  late AnimationController controller;

  startSplashScreen() async {
    var duration = const Duration(milliseconds: 2500);
    return Timer(duration, () {
      if (token != null) {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const MainPage()));
      } else {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const LoginPage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadSharedPreference();
    // getLoginState(context);
    startSplashScreen();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      // getLoginState(context);
    });
  }

  loadSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    DateTime dateNow = DateTime.now();
    await prefs.setString('start_date', dateNow.toString());
    await prefs.setString('end_date', dateNow.toString());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (_) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Opacity(
                      opacity: opacity.value,
                      child: Image.asset(
                        'assets/icons/app_logo.png',
                        height: 250.h,
                        width: 250.w,
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8).w,
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: 'Powered by '),
                        TextSpan(
                            text: 'Cipta Solutindo Tech',
                            style: TextStyle(fontWeight: FontWeight.bold)
                        )
                      ]
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
