import 'package:flutter/material.dart';
import 'package:reva_doc/driver/driver_home_screen.dart';
import 'package:reva_doc/driver/driver_user_details.dart';

class DriverMainScreen extends StatefulWidget {
  const DriverMainScreen({super.key});

  @override
  State<DriverMainScreen> createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  List<Widget> screens = [
    const DriverHomeScreen(),
    const DriverUserDetailScreen()
  ];

  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
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
