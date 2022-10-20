import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/home/presentation/cubit/bottom_navigation_cubit.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: BlocProvider.of<BottomNavigationCubit>(context).getNavigationItems(context),
      currentIndex:BlocProvider.of<BottomNavigationCubit>(context).bottomNavIndex,
      onTap:(value){
        BlocProvider.of<BottomNavigationCubit>(context).changeIndex(value,context);
      } ,
    );
  }
}
