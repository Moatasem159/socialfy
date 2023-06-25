import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/features/messenger/presentation/cubits/tab_bar_cubit/tab_bar_cubit.dart';
import 'package:socialfy/features/messenger/presentation/cubits/tab_bar_cubit/tab_bar_state.dart';
import 'package:socialfy/features/messenger/presentation/widgets/custom_tab_bar/tab_bar_button.dart';
class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarCubit, TabBarStates>(
      builder: (context, state) {
        TabBarCubit cubit=TabBarCubit.get(context);
        return SliverAppBar(
          toolbarHeight: 65,
          expandedHeight: 65,
          floating: true,
          snap: true,
          flexibleSpace: Center(
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(8),
              width: context.getWidth(w: 1.1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27.5),
                  border:
                  Border.all(width: 1, color: Colors.grey.withOpacity(.5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TabBarButton(
                      onTap: () {
                        cubit.change(0);
                      },
                      title: "all users",
                      backColor: cubit.index==0?Theme.of(context).primaryColor:Theme.of(context).colorScheme.background,
                      textColor: cubit.index==0?Theme.of(context).colorScheme.background:Theme.of(context).primaryColor),
                  TabBarButton(
                      onTap: () {
                        cubit.change(1);
                      },
                      title: "Your chats",
                      backColor: cubit.index==1?Theme.of(context).primaryColor:Theme.of(context).colorScheme.background,
                      textColor: cubit.index==1?Theme.of(context).colorScheme.background:Theme.of(context).primaryColor)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}