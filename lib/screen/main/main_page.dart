import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/app_constant.dart';
import '../donation/donation_page.dart';
import '../donation/my_donation_page.dart';
import '../homepage/home_page.dart';
import '../mail/mail_page.dart';
import '../profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {

  late TabController _bottomTabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _bottomTabController = TabController(length: 5, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _bottomTabController.animateTo(
          index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease
      );
    });
  }

  List<Widget> listPage = [
    const HomePage(),
    const DonationPage(),
    const MyDonationPage(),
    const MailPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.black,
        elevation: 4,
        title: Text(
          AppConstant.appName,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white
          ),
        ),
      ),
      body: TabBarView(
        controller: _bottomTabController,
        physics: const NeverScrollableScrollPhysics(),
        children: listPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.lightBlueAccent,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
            tooltip: 'Halaman Utama'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: 'Donasi',
              tooltip: 'Halaman Donasi'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.handshake_rounded),
              label: 'Donasi Saya',
              tooltip: 'Halaman Donasi Saya'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail_rounded),
              label: 'Inbox',
              tooltip: 'Halaman Kotak Masuk'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Akun',
              tooltip: 'Halaman Pengaturan Akun'
          ),
        ],
      ),
    );
  }
}
