import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialfy/core/utils/strings_manager.dart';

class EmptyCommentWidget extends StatelessWidget {
  const EmptyCommentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Column(children: [
          Icon(
            FontAwesomeIcons.solidComments,
            size: 100,
            color:Colors.grey[500],
          ),
          const SizedBox(height: 5,),
          const Text(AppStrings.noCommentsYet),
          const SizedBox(height: 2,),
          const Text(AppStrings.beTheFirstToComment),
        ]),
      ),
    );
  }
}
