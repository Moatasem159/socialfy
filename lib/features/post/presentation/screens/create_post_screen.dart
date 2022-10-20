import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/post_state.dart';
import 'package:socialfy/features/post/presentation/screens/finishing_post_screen.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostCubit>(context).getImagesPath();
  }

  ScrollController single = ScrollController();

  @override
  void dispose() {
    single.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PostCubit cubit = BlocProvider.of<PostCubit>(context);
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.clear_outlined)),
                title: const Text("New post"),
                titleTextStyle: Theme.of(context)
                    .appBarTheme
                    .titleTextStyle!
                    .copyWith(fontSize: 20),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FinishingPostScreen(imageFile: cubit.image),
                          ));
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Next',
                          style: Theme.of(context)
                              .appBarTheme
                              .titleTextStyle!
                              .copyWith(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              body: NestedScrollView(
                controller: single,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      collapsedHeight: 190,
                      expandedHeight: 190,
                      automaticallyImplyLeading: false,
                      flexibleSpace: cubit.image != null
                          ? Image.file(File(cubit.image!),
                              height: MediaQuery.of(context).size.height * 0.45,
                              width: MediaQuery.of(context).size.width)
                          : Container(),
                    ),
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverPersistentHeader(
                          floating: true,
                          pinned: true,
                          delegate: CreatePostDelegate(
                            child: cubit.files != null
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          items: getItems(),
                                          onChanged: (value) {
                                            assert(value.files.length > 0);
                                            setState(() {
                                              cubit.selectedModel = value;
                                              cubit.image = cubit
                                                  .selectedModel!.files![0];
                                            });
                                          },
                                          value: cubit.selectedModel,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          )),
                    )
                  ];
                },
                body: cubit.files != null
                    ? cubit.selectedModel == null &&
                            cubit.selectedModel!.files!.isEmpty
                        ? Container()
                        : Builder(builder: (context) {
                            return CustomScrollView(slivers: [
                              SliverOverlapInjector(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context),
                              ),
                              SliverGrid(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 4),
                                  delegate: SliverChildBuilderDelegate(
                                      childCount: cubit.selectedModel!.files!
                                          .length, (context, index) {
                                    var image =
                                        cubit.selectedModel!.files![index];
                                    return GestureDetector(
                                      child: Image(
                                        frameBuilder: (context, child, frame,
                                            wasSynchronouslyLoaded) {
                                          if (frame == null) {
                                            return Container(
                                              color: Colors.grey,
                                            );
                                          } else {
                                            return child;
                                          }
                                        },
                                        image: FileImage(File(image)),
                                        fit: BoxFit.cover,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          cubit.image = image;
                                          cubit.imageFile = File(image);
                                          single.animateTo(0.0,
                                              duration: const Duration(
                                                  milliseconds: 1500),
                                              curve: Curves
                                                  .fastLinearToSlowEaseIn);
                                        });
                                      },
                                    );
                                  })),
                            ]);
                          })
                    : Container(),
              )),
        );
      },
    );
  }

  List<DropdownMenuItem> getItems() {
    return BlocProvider.of<PostCubit>(context)
        .files!
        .map((e) => DropdownMenuItem(
              value: e,
              child: Text(
                e.folder!,
                style: const TextStyle(color: Colors.black),
              ),
            ))
        .toList();
  }
}

class CreatePostDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  CreatePostDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Theme.of(context).backgroundColor, child: child);
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
