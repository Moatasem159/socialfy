import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:socialfy/features/profile/presentation/widgets/posts_tab_bar_widgets/tab_bar_delegate.dart';
class PostsTabBar extends StatelessWidget {
  const PostsTabBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        return SliverOverlapAbsorber(
          handle: cubit.appbar,
          sliver: SliverPersistentHeader(pinned: true, delegate: TabBarDelegate()),
        );
      },
    );
  }
}