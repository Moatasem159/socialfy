import 'package:flutter/material.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:socialfy/features/profile/presentation/widgets/profile_posts_list.dart';
class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(handle: ProfileCubit.get(context).appbar),
        const ProfilePostsList(),
      ],
    );
  }
}