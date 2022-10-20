import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/post_state.dart';
import 'package:socialfy/features/post/presentation/widgets/post_list_widget.dart';
import 'package:socialfy/features/post/presentation/widgets/post_loading_list_widget.dart';



class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PostCubit cubit=BlocProvider.of<PostCubit>(context);
    return BlocConsumer<PostCubit, PostStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: ()async {
            BlocProvider.of<PostCubit>(context).getNewFeed();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children:  [
                if(cubit.posts!=null)
                PostListWidget(posts: cubit.posts!),
               if(state is GetNewsFeedLoadingState&&cubit.posts==null)
               const PostLoadingListWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
