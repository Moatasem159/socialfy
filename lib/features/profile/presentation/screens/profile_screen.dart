import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:socialfy/features/profile/presentation/widgets/posts_tab_bar_widgets/posts_tab_bar.dart';
import 'package:socialfy/features/profile/presentation/widgets/profile_details_widgets/profile_details_widget.dart';
import 'package:socialfy/features/profile/presentation/widgets/profile_screen_body.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        if (state is GetProfileSuccessState) {
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                ProfileDetailsWidget(user: state.profile),
                const PostsTabBar(),
              ];
            },
            body: const ProfileScreenBody(),
          );
        }
        return const Center(child: LoadingWidget());
      },
    );
  }
}