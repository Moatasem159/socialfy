import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
class TimeText extends StatelessWidget {
  final String time;
  const TimeText({super.key, required this.time});
  @override
  Widget build(BuildContext context) {
    return Text(DateFormat('h:mm a').format(DateTime.parse(time)),style: AppTextStyles.getNormalText(
        fontSize: FontSize.s12, color: Colors.white));
  }
}