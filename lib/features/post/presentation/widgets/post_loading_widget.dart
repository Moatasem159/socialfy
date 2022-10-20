import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:socialfy/core/utils/icons_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';

class PostLoadingWidget extends StatelessWidget {
  const PostLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        //profile image
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery
              .of(context)
              .size
              .width - 350),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey[400]!,
                child: const CircleAvatar(
                  radius: 17,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey[400]!,
                child:  Container(
                  width: 170,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_vert_outlined)
            ],
          ),
        ),
        const SizedBox(height: 5,),
        Shimmer.fromColors(
         baseColor: Colors.grey,
         highlightColor: Colors.grey[400]!,
         child: Container(
           color: Colors.grey,
              width: double.maxFinite,
            height: 300,
          ),
       ),
        const SizedBox(height: 10,),
        //buttons
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery
              .of(context)
              .size
              .width - 350),
          child: Row(
            children: const [
              Icon(
                  Icons.favorite_outline, size: AppSize.s35,),
              SizedBox(width: 5,),
              Icon(MyCustomIcons.commentAlt2, size: AppSize.s31,),
              SizedBox(width: 7,),
              // Icon(Icons.send_outlined, size: AppSize.s33,),
              Spacer(),
              Icon(
                Icons.bookmark_border_outlined, size: AppSize.s35,),
            ],
          ),
        ),
        const SizedBox(height: 5,),
        //likes
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery
                .of(context)
                .size
                .width - 350),
            child:Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[400]!,
              child:  Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
          ),
        //caption
        const SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery
                .of(context)
                .size
                .width - 350),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[400]!,
              child:  Container(
                width: 250,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
          ),
        //comments
        const SizedBox(height: 5,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery
              .of(context)
              .size
              .width - 350),
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey[400]!,
            child:  Container(
              width: 150,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
        ),
        //time
        const SizedBox(height: 5,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery
              .of(context)
              .size
              .width - 350),
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey[400]!,
            child:  Container(
              width: 56,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}
