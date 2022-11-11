import 'package:flutter/material.dart';
import 'package:scroll_to_appbar_hide/pages/homepage.dart';
import 'package:scroll_to_appbar_hide/pages/profilepage.dart';
import 'package:scroll_to_appbar_hide/pages/shoppage.dart';
import 'package:scroll_to_appbar_hide/widgets/app_bottomnav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Keeping State with the Bottom Navigation Bar in Flutter
  final List<Widget> pages = [
    const HomePage(
      key: PageStorageKey('home_page_key'),
    ),
    const ShopPage(
      key: PageStorageKey('shop_page_key'),
    ),
    const ProfilePage(
      key: PageStorageKey('profile_page_key'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBarWidget(
        selectedIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
      ),
      body: PageStorage(
        bucket: bucket,
        child: pages[selectedIndex],
      ),
    );
  }
}
