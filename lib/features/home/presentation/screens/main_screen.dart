// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_state.dart';
import 'package:socialfy/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:socialfy/features/post/presentation/screens/create_post_screen.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BottomNavigationCubit>(),
      child: BlocConsumer<BottomNavigationCubit, BottomNavigationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: BlocProvider.of<BottomNavigationCubit>(context)
                          .bottomNavIndex == 4
                  ? AppBar(
                      title: Text(BlocProvider.of<ProfileCubit>(context).profile!.name!),
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
                            Navigator.of(context).pushNamed(Routes.settingsScreenRoute);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.menu_outlined),
                          ),
                        ),
                      ],
                    )
                  : AppBar(
                      title: const Text(AppStrings.appTitle),
                      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                        fontFamily: FontConstants.billaBong,
                        fontSize: 35
                      ),
                      actions: const [
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.search_outlined),
                        ),
                      ],
                    ),
              body: BlocProvider.of<BottomNavigationCubit>(context).screens[
                  BlocProvider.of<BottomNavigationCubit>(context)
                      .bottomNavIndex],
              bottomNavigationBar: MainBottomNavigationBar(),
            ),
          );
        },
      ),
    );
  }
}

/*return BottomSheet(onClosing: (){}, builder:(context) {
return Column(children: [
Row(
children: const [
Icon(MyCustomIcons.themeIcon),
SizedBox(width: 5,),
Text("theme"),
],
)
],);
},);*/