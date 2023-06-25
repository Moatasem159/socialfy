import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_state.dart';
import 'package:socialfy/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:socialfy/features/post/presentation/screens/create_post_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: BlocConsumer<BottomNavigationCubit, BottomNavigationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          BottomNavigationCubit cubit =
              BlocProvider.of<BottomNavigationCubit>(context);
          return DefaultTabController(
            length: 1,
            child: SafeArea(
              child: Scaffold(
                appBar: cubit.bottomNavIndex == 4
                    ? AppBar(
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
                      )
                    : AppBar(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  title: const Text(AppStrings.appTitle),
                  titleTextStyle: Theme.of(context)
                      .appBarTheme
                      .titleTextStyle!
                      .copyWith(
                    fontFamily: FontConstants.billaBong,
                    fontSize: 35,
                  ),
                  actions: const [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
                body: cubit.screens[cubit.bottomNavIndex],
                    bottomNavigationBar: MainBottomNavigationBar(
                  items: cubit.getNavigationItems(context),
                  index: cubit.bottomNavIndex,
                  onTap: (value) {
                    cubit.changeIndex(value, context);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}