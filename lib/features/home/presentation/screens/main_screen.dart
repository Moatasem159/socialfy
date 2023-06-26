import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_cubit.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_state.dart';
import 'package:socialfy/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:socialfy/features/home/presentation/widgets/main_app_bar.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationStates>(
        builder: (context, state) {
          BottomNavigationCubit cubit = BottomNavigationCubit.get(context);
          return DefaultTabController(
            length: 1,
            child: SafeArea(
              child: Scaffold(
                appBar:MainAppBar(index: cubit.bottomNavIndex),
                backgroundColor: Theme.of(context).colorScheme.background,
                body: cubit.screens[cubit.bottomNavIndex],
                    bottomNavigationBar: MainBottomNavigationBar(
                  items: cubit.getNavigationItems,
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