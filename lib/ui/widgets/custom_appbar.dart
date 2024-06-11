import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double iconSize;
  final double borderSize;
  final String? title;

  const CustomAppBar({
    super.key,
    this.iconSize = 24.0,
    this.borderSize = 1.0, this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffE5E7EB), width: borderSize),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: iconSize,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle back button tap
              Navigator.pop(context);
            },
          ),
        ),
      ),
      title: Text(title ?? ""),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
