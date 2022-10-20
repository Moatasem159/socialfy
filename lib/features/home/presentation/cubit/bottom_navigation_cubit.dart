import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_state.dart';
import 'package:socialfy/features/messenger/presentation/screens/messenger_screen.dart';
import 'package:socialfy/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:socialfy/features/post/presentation/screens/create_post_screen.dart';
import 'package:socialfy/features/post/presentation/screens/news_feed_screen.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:socialfy/features/profile/presentation/screens/profile_screen.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationStates> {
  BottomNavigationCubit() : super(BottomNavigationInitialState());

  List<BottomNavigationBarItem> getNavigationItems(BuildContext context) {
    return [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: ""),
      const BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none_outlined),
          label: "notifications"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined), label: ""),
      const BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined), label: ""),
      BottomNavigationBarItem(
          icon: BlocProvider.of<ProfileCubit>(context).profile == null
              ? const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey,
                )
              : CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 14,
                      backgroundImage: CachedNetworkImageProvider(
                        "${BlocProvider.of<ProfileCubit>(context).profile!.profilePic}",
                      )),
                ),
          label: ""),
    ];
  }

  int bottomNavIndex = 0;
  List<Widget> screens = [
    const NewsFeedScreen(),
    const NotificationsScreen(),
    const CreatePostScreen(),
    const MessengerScreen(),
    const ProfileScreen(),
  ];

  void changeIndex(int index, BuildContext context) {
    emit(ChangeBottomNavLoadingState());
    if (index == 2) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const CreatePostScreen(),
      ));
    }
    else if (index==4){
      BlocProvider.of<ProfileCubit>(context).getUserPost(context: context);
      bottomNavIndex = index;
    }
    else{
      bottomNavIndex = index;
    }

    emit(ChangeBottomNavDoneState());
  }
}
