import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/get_time.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/values_manager.dart';
class PostTime extends StatelessWidget {
  final String time;
  const PostTime({super.key,required this.time});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        getTime(time),
        style: AppTextStyles.getNormalText(fontSize: AppSize.s10, color: Colors.grey[300]!)
      ),
    );
  }
}