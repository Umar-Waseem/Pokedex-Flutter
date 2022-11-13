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
    return const SafeArea(
      child: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: TabBarView(
            children: [
              AllScreen(),
              HomeScreen(),
              FavScreen(),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(8.0),
            child: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              indicatorColor: Colors.red,
              tabs: [
                Tab(
                  icon: Icon(Icons.list),
                ),
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
