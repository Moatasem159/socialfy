import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/profile_picture_widget.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_state.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_chats_cubit/get_chats_cubit.dart';
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
      BottomNavigationBarItem(icon: ProfilePicWidget(image:  AppStrings.profilePic!),label: ''),
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
    }
    else if(index==3){
      if(!GetChatsCubit.get(context).isSuccess()) {
        GetChatsCubit.get(context).getUserChats();
      }
      bottomNavIndex = index;
    }else {
      bottomNavIndex = index;
    }
    emit(ChangeBottomNavDoneState());
  }
}