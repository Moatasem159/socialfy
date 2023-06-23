import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/core/models/user_model.dart';

class ProfileDetailsWidget extends StatelessWidget {

  final UserDataModel user;
  final int postCount;

  const ProfileDetailsWidget({Key? key, required this.user, required this.postCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical:5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children:  [
                  CachedNetworkImage(
                      imageUrl:user.profilePic!,
                     width:75,
                    height:75,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider
                          )
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(postCount.toString(),
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 14,
                          ),),
                        const SizedBox(height: 5,),
                        Text("posts",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 14,
                        ),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children:  [
                        Text("0", style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 14,
                        ),),
                        const SizedBox(height: 5,),
                        Text("followers", style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 14,
                        ),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children:[
                        Text("0", style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 14,
                        ),),
                        const SizedBox(height: 5,),
                        Text("following", style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 14,
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3,),
              Text(
                user.name!, style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 14,
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
