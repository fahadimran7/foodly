import 'package:flutter/material.dart';

import '../shared/styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key, this.onNavItemTapped, required this.currentIndex})
      : super(key: key);
  final void Function(int)? onNavItemTapped;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onNavItemTapped,
      selectedItemColor: kcPrimaryColor,
      unselectedItemColor: Colors.black54,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Icon(Icons.restaurant),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Icon(Icons.search),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Orders',
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Icon(Icons.history),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Icon(Icons.person),
          ),
        )
      ],
    );
  }
}
