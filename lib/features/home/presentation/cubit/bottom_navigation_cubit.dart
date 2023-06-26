import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_state.dart';
import 'package:socialfy/features/messenger/presentation/screens/messenger_screen.dart';
import 'package:socialfy/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:socialfy/features/post/presentation/screens/create_post_screen.dart';
import 'package:socialfy/features/post/presentation/screens/news_feed_screen.dart';
import 'package:socialfy/features/profile/presentation/screens/profile_screen.dart';
class BottomNavigationCubit extends Cubit<BottomNavigationStates> {
  BottomNavigationCubit() : super(BottomNavigationInitialState());
  static BottomNavigationCubit get(context)=>BlocProvider.of(context);
  List<BottomNavigationBarItem> getNavigationItems=
     [
      const BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
      const BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
      const BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: ""),
      const BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.facebook_messenger, size: 27), label: ""),
      BottomNavigationBarItem(
        label: "",
        icon: CachedNetworkImage(
            imageUrl: AppStrings.profilePic!,
            height: 30,
            fadeOutDuration: Duration.zero,
            fadeInDuration: Duration.zero,
            width: 40,
            errorWidget: (context, url, error) => Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(ImageAssets.noProfileImagePath))),
                ),
            imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(image: imageProvider)),
                ),
            placeholder: ((context, url) => Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(ImageAssets.noProfileImagePath))),
                ))),
      ),
    ];

  int bottomNavIndex = 0;
  List<Widget> screens = [
    const NewsFeedScreen(),
    const NotificationsScreen(),
    const CreatePostScreen(),
    const MessengerScreen(),
    const ProfileScreen(),
  ];
  void changeIndex(int index, BuildContext context) {
    if (index == 2) {
     GoRouter.of(context).pushNamed(Routes.createPostScreenRoute);
    } else {
      bottomNavIndex = index;
    }
    emit(ChangeBottomNavDoneState());
  }
}