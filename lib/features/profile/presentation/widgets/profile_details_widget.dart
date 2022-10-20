import 'package:flutter/material.dart';
import 'package:socialfy/features/profile/data/models/user_model.dart';

class ProfileDetailsWidget extends StatelessWidget {

  final UserDataModel user;
  final int postCount;
  const ProfileDetailsWidget({Key? key, required this.user, required this.postCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical:15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children:  [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.profilePic!),
                    radius: 40,
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
              const SizedBox(height: 2,),
              Text(user.name!, style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 14,
              ),)
            ],
          ),
        ),
        // MainButton(onPressed: (){}, width:45, height: 40, child: const Text("Edit profile")),
      ],
    );
  }
}
