import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_state.dart';
import 'package:socialfy/features/profile/presentation/widgets/profile_details_widget.dart';
import 'package:socialfy/features/profile/presentation/widgets/profile_posts_list.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit=BlocProvider.of<ProfileCubit>(context);
    return BlocConsumer<ProfileCubit,ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  DefaultTabController(
          length: 1,
          child: NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return[
                SliverAppBar(
                  collapsedHeight: 150,
                  expandedHeight: 150,
                  flexibleSpace: ProfileDetailsWidget(postCount: cubit.userPosts!.length,user: cubit.profile!),),
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverPersistentHeader(
                      floating: true,
                      pinned: true,
                      delegate: Delegate(
                          tabBar: TabBar(
                            indicatorColor: Colors.black,
                            labelColor: Colors.black,
                            tabs: [
                              Icon(Icons.grid_on,color: Theme.of(context).iconTheme.color,),
                            ],
                          )
                      )
                  ),
                ),
              ];
            },
            body:ProfilePostsList(posts: cubit.userPosts!),
          ),
        );
      },
    );
  }
}
class Delegate extends SliverPersistentHeaderDelegate {

  final TabBar tabBar;

  Delegate({required this.tabBar});

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return Container(

      color: Theme.of(context).backgroundColor,
        child: tabBar);
  }

  @override
  double get maxExtent => 28;

  @override
  double get minExtent => 28;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}