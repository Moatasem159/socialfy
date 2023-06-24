import 'package:flutter/material.dart';

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: TabBar(
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        indicatorWeight: .9,
        tabs: [
          Icon(
            Icons.grid_on,
            color: Theme.of(context).iconTheme.color,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 24.5;

  @override
  double get minExtent => 24.5;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
