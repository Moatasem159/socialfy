import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/like_post_cubit/like_post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/like_post_cubit/like_post_state.dart';
class ImageLikeAnimations extends StatefulWidget {
  final Post post;
  const ImageLikeAnimations({Key? key,required this.post}) : super(key: key);
  @override
  State<ImageLikeAnimations> createState() => _ImageLikeAnimationsState();
}
class _ImageLikeAnimationsState extends State<ImageLikeAnimations> {
  bool isLiked=false;
  bool isHeartAnimating=false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikePostCubit, LikePostStates>(
  builder: (context, state) {
    return GestureDetector(
      onDoubleTap: (){
        LikePostCubit.get(context).likePost(postId: widget.post.postId,likes: widget.post.likes!,isLiked: widget.post.isLiked);
        widget.post.isLiked=!widget.post.isLiked;
        setState(() {
          isLiked=true;
          isHeartAnimating=true;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            imageUrl:widget.post.postImage!,
            fadeInDuration: Duration.zero,
           fadeOutDuration: Duration.zero,
            imageBuilder: (context, imageProvider) {
                return AspectRatio(
                  aspectRatio:(widget.post.postImageWidth!/widget.post.postImageHeight)<0.9?0.9:
                  (widget.post.postImageWidth!/widget.post.postImageHeight),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imageProvider
                      )
                    ),
                  ),
                );
              },
            progressIndicatorBuilder: (context, url, progress) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: (widget.post.postImageWidth!/widget.post.postImageHeight)<0.9?0.9:
                    (widget.post.postImageWidth!/widget.post.postImageHeight),
                    child: Container(
                      color:Theme.of(context).colorScheme.background,
                    ),
                  ),
                  SizedBox(
                    width:70,
                    height: 70,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                      strokeWidth: .8,
                      value: progress.progress
                    ),
                  ),
                ],
              );
            },
              fit: BoxFit.contain,
          ),
          AnimatedOpacity(
            duration:const Duration(milliseconds: 90) ,
            opacity: isHeartAnimating?1:0,
            child: HeartAnimationWidget(
                onEnd: ()=>setState(() {
                  isHeartAnimating=false;
                }),
                duration: const Duration(milliseconds: 230),
                isAnimating: isHeartAnimating,
                child: const Icon(Icons.favorite,color:Colors.white,size: 100,)),
          )
        ],
      ),
    );
  },
);
  }
}



class HeartAnimationWidget extends StatefulWidget {

  final Widget child;
  final bool ?isAnimating;
  final Duration duration;
  final VoidCallback ? onEnd;
  final bool alwaysAnimating;

  const HeartAnimationWidget({
    Key? key,
    required this.isAnimating,
    required this.duration,
    required this.child,
    this.onEnd,
    this.alwaysAnimating=false
  }): super(key: key);
  @override
  HeartAnimationWidgetState createState()=>HeartAnimationWidgetState();
}

class HeartAnimationWidgetState extends State<HeartAnimationWidget> with TickerProviderStateMixin {


  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this ,duration: widget.duration);
    scale=Tween<double>(begin: 1,end: 1.3).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  void didUpdateWidget(covariant HeartAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(widget.isAnimating !=oldWidget.isAnimating){
      doAnimation();
    }
  }

  Future doAnimation()async{
    if(widget.isAnimating!|| widget.alwaysAnimating){
      await controller.forward();
      await controller.reverse();
      await Future.delayed(const Duration(milliseconds: 100));

      if(widget.onEnd!=null){
        widget.onEnd!();
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: scale,
        child: widget.child);
  }
}
