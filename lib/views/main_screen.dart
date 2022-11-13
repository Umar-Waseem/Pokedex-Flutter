import 'package:flutter/material.dart';

import 'screens/all_screen.dart';
import 'screens/fav_screen.dart';
import 'screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: const [
            AllScreen(),
            HomeScreen(),
            FavScreen(),
          ],
        ),
      ),
    );
  }
}
