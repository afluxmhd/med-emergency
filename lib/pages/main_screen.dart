import 'package:flutter/material.dart';
import 'package:reva_doc/pages/home_screen.dart';
import 'package:reva_doc/pages/logo_splash_screen.dart';
import 'package:reva_doc/pages/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [const HomeScreen(), const UserProfileScreen()];

  int _currentScreen = 0;
  bool _isLoading = true;

  void _loadingData() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _loadingData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? const LogoSplashScreen() : screens[_currentScreen],
      bottomNavigationBar: _isLoading
          ? null
          : BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: _currentScreen,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color.fromARGB(255, 230, 69, 69),
              unselectedItemColor: const Color.fromARGB(255, 172, 172, 172),
              onTap: (value) {
                setState(() {
                  _currentScreen = value;
                });
              },
              items: const [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(
                      Icons.home,
                      size: 40,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'User',
                    icon: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                ]),
    );
  }
}
