import 'package:flutter/material.dart';
import 'package:socialfy/features/post/presentation/widgets/post_loading_widget.dart';
class PostLoadingListWidget extends StatelessWidget {
  const PostLoadingListWidget({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const PostLoadingWidget();
      },);
  }
}
