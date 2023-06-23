import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
class EmptyCommentWidget extends StatelessWidget {
  const EmptyCommentWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            FontAwesomeIcons.solidComments,
            size: 100,
            color: Colors.grey[500],
          ),
          5.ph,
          const Text(AppStrings.noCommentsYet),
         2.ph,
          const Text(AppStrings.beTheFirstToComment),
        ],
      ),
    );
  }
}