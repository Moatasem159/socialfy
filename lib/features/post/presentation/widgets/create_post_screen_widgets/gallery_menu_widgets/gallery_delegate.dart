import 'package:flutter/material.dart';
class GalleryAlbumsDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  GalleryAlbumsDelegate({required this.child});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Theme.of(context).colorScheme.background, child: child);
  }
  @override
  double get maxExtent => 40;
  @override
  double get minExtent => 40;
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}