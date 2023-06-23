import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/presentation/screens/create_post_screen.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_state.dart';
import 'package:socialfy/features/profile/presentation/widgets/profile_details_widget.dart';
import 'package:socialfy/features/profile/presentation/widgets/profile_posts_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliverOverlapAbsorberHandle appbar = SliverOverlapAbsorberHandle();
    ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if(cubit.profile!=null)
          {
            return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [

                    SliverToBoxAdapter(
                      child: ProfileDetailsWidget(
                          user: BlocProvider.of<ProfileCubit>(context).profile!,
                          postCount: BlocProvider.of<ProfileCubit>(context)
                              .userPosts!
                              .length),
                    ),
                    SliverOverlapAbsorber(
                      handle: appbar,
                      sliver: SliverPersistentHeader(
                          pinned: true, delegate: Delegate()),
                    ),
                  ];
                },
                body: CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(handle: appbar),
                    ProfilePostsList(posts: cubit.userPosts!),
                  ],
                ));
          }
        if(cubit.profile == null)
          {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 65,
                height: 65,
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                  strokeWidth:.8,
                ),
              ),
            );
          }
        return Container();

      },
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
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
class Delegate2 extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      title: Text(AppStrings.userName!),
      titleTextStyle: Theme.of(context)
          .appBarTheme
          .titleTextStyle!
          .copyWith(fontSize: 17),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreatePostScreen(),
            ));
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.add_box_outlined),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(Routes.settingsScreenRoute);
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu_outlined),
          ),
        ),
      ],
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
