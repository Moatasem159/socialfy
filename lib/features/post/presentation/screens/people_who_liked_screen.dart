import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/features/post/data/models/like_model.dart';

class PeopleWhoLikedScreen extends StatelessWidget {
 final List<LikeModel> likes;
  const PeopleWhoLikedScreen({Key? key, required this.likes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("People who Liked",style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
          fontSize: 20
        ),),
      ),
      body: SingleChildScrollView(
          child: Column(children:[
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: likes.length,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  children: [
                    Stack(
                      children: [
                       const SizedBox(
                          height: 49,
                         width: 49,
                        ),
                        CircleAvatar(
                            radius: 22,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(likes[index].profilePic!),
                            backgroundColor: Colors.grey,
                            radius: 20,
                          ),
                        ),
                      const Positioned(
                        bottom:0,
                        right:0,
                          child: Icon(
                        Icons.favorite_outlined,
                        color: Colors.red,
                      ))
                    ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      likes[index].username!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeightManager.semiBold),
                    ),
                  ],
                ),
              );
            },)
          ])
      ),
    ));
  }
}
