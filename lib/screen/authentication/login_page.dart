import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/app_style.dart';
import '../main/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'Login Dulu Bosque',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const MainPage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              elevation: 2,
            ),
            icon: Icon(
              Icons.login_rounded,
              color: Colors.white,
              size: 14.sp,
            ),
            label: Text(
              'Login Bossque',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                shadows: AppStyle.shadow
              ),
            ), // <-- Text
          ),
        ],
      ),
    );
  }
}
