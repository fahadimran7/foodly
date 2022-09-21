import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key, this.onNavItemTapped, required this.currentIndex})
      : super(key: key);
  final void Function(int)? onNavItemTapped;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: globalContentPadding),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          onTap: onNavItemTapped,
          selectedItemColor: kcPrimaryColor,
          unselectedItemColor: Colors.black54,
          selectedFontSize: kBodyTextTiny,
          unselectedFontSize: kBodyTextTiny,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Icon(
                  Icons.restaurant,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Icon(
                  Icons.search,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Orders',
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Icon(
                  Icons.history,
                  size: 19,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Icon(
                  Icons.person,
                  size: 19,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
