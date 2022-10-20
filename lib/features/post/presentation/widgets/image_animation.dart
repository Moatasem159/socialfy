import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';

class ImageLikeAnimations extends StatefulWidget {
  final String postImage;
  final String postId;
  final Post ?model;

  const ImageLikeAnimations({Key? key,required this.postImage,required this.postId, this.model}) : super(key: key);

  @override
  State<ImageLikeAnimations> createState() => _ImageLikeAnimationsState();
}

class _ImageLikeAnimationsState extends State<ImageLikeAnimations> {
  bool isLiked=false;
  bool isHeartAnimating=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        BlocProvider.of<PostCubit>(context).like(
            postId: widget.model!.postId!,
            uid: BlocProvider.of<ProfileCubit>(context)
                .profile!
                .uId!,
            name: BlocProvider.of<ProfileCubit>(context)
                .profile!
                .name!,
            profilePic: BlocProvider.of<ProfileCubit>(context)
                .profile!
                .profilePic!);
        setState(() {
          isLiked=true;
          isHeartAnimating=true;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            child: Hero(
              tag: "PostImage${widget.postId}",
              child: Image(
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    if(frame==null) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        color: Colors.grey,
                      );
                    } else {
                      return child;
                    }

                  },
                  errorBuilder: (context, error, stackTrace) => Container(width: MediaQuery.of(context).size.width,height: 250,color: Colors.grey ,),
                  loadingBuilder: (context, child, loadingProgress){
                    return loadingProgress==null?child:Container(width: MediaQuery.of(context).size.width,height: 250,color: Colors.black38,
                      child: Center(child: CircularProgressIndicator(
                        color: Colors.grey[500],
                      )),);
                  },
                  fit: BoxFit.contain,
                  image:NetworkImage(widget.postImage,)
              ),
            ),

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
