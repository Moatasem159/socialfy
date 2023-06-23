import 'package:flutter/material.dart';
class MainBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int index;
  final ValueChanged<int>? onTap;
  const MainBottomNavigationBar({Key? key,
    required this.items,
    required this.index,
    this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor:  Colors.transparent,
      ),
      child: BottomNavigationBar(
      items: items,
      currentIndex:index,
      onTap:onTap,

        ),
    );
  }
}
