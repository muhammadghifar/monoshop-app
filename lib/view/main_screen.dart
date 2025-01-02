import 'package:flutter/material.dart';
import 'package:submission/utils/color.dart';
import 'package:submission/view/home/home_screen.dart';
import 'package:submission/view/product/search_screen.dart';
import 'package:submission/view/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  final String username;
  const MainScreen({super.key, this.username = 'Guest'});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late List<Widget> _pages = [];

  // final List<Widget> _pages = [
  //   const HomeScreen(),
  //   const SearchScreen(),
  //   const ProfileScreen(),
  // ];

  @override
  void initState() {
    super.initState();

    _pages = [
      const HomeScreen(),
      const SearchScreen(),
      ProfileScreen(
        username: widget.username,
        // email: widget.email,
        // fullname: widget.fullname,
      ),
    ];
  }

  String getUsernameByEmail(String email) {
    if (email.contains("@")) {
      final List<String> splitEmail = email.split('@');
      return splitEmail[0];
    }

    return email;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            title: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Hello, ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextSpan(
                    text: getUsernameByEmail(widget.username),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.contentBackground,
            elevation: 0,
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.semidarkBackground,
        selectedItemColor: AppColors.contentBackground,
        selectedFontSize: 14,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.favorite),
          //   label: 'Wishlist',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
