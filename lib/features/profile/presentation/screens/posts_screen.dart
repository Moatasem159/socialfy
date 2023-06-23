import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/post_state.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget_widgets/post_widget.dart';

class PostsScreen extends StatefulWidget {
  final List<Post> posts;
  final int index;

  const PostsScreen({
    Key? key,
    required this.posts,
    required this.index,
  }) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  ItemScrollController itemController = ItemScrollController();

  // Future scrollToItem() async {
  //   itemController.jumpTo(index: widget.index);
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) => scrollToItem());
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text("posts",style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
              fontSize: 20
            ),),
          ),
          body: ScrollablePositionedList.builder(
            itemScrollController: itemController,
            initialScrollIndex: widget.index,
            shrinkWrap: true,
            itemCount: widget.posts.length,
            itemBuilder: (context, index) {
              return BlocConsumer<PostCubit,PostStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return PostWidget(post: widget.posts[index]);
                },
              );
            },
          ),
      ),
    );
  }
}
