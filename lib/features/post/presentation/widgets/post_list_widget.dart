import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget.dart';

class PostListWidget extends StatelessWidget {
  final List<PostModel> posts;
  const PostListWidget({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
      return PostWidget(post: posts[index]);
    },);
  }
  Widget _buildPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 560.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children:[
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            height: 50.0,
                            width: 50.0,
                            image: AssetImage(ImageAssets.image1),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: const Text(
                      "authorName",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text("12 hours"),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_horiz),
                      color: Colors.black,
                      onPressed: (){},
                    ),
                  ),
                  InkWell(
                    onTap: () {
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage(ImageAssets.image2),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.favorite_border),
                                  iconSize: 30.0,
                                  onPressed: (){},
                                ),
                                const Text(
                                  '2,515',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20.0),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.chat),
                                  iconSize: 30.0,
                                  onPressed: () {},
                                ),
                                const Text(
                                  '350',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.bookmark_border),
                          iconSize: 30.0,
                          onPressed: (){},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
