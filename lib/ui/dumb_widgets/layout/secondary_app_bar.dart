import 'package:flutter/material.dart';

class SecondaryAppBar extends StatelessWidget with PreferredSizeWidget {
  const SecondaryAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: 0.4,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 15,
        ),
        onPressed: () {},
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
