import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/values_manager.dart';
class MessageDateWidget extends StatelessWidget {
  final String date;
  const MessageDateWidget({super.key, required this.date});
  String _dateString(String date) {
    DateTime dateTime = DateTime.parse(date);
    String result;
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));
    DateTime yesterday1 = today.subtract(const Duration(days: 2));
    DateTime yesterday2 = today.subtract(const Duration(days: 3));
    DateTime yesterday3 = today.subtract(const Duration(days: 4));
    DateTime yesterday4 = today.subtract(const Duration(days: 5));
    DateTime yesterday5 = today.subtract(const Duration(days: 6));
    if (dateTime.day == today.day) {
      result = 'Today';
    }
    else if (dateTime.day == yesterday.day) {
      result = 'Yesterday';
    }
    else if (dateTime.day == yesterday1.day ||
        dateTime.day == yesterday2.day ||
        dateTime.day == yesterday3.day ||
        dateTime.day == yesterday4.day ||
        dateTime.day == yesterday5.day) {
      result = DateFormat('EEEE').format(dateTime);
    }
    else {
      result = DateFormat('dd MMM yyyy').format(dateTime);
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p4),
      margin: const EdgeInsets.all(AppMargin.m8),
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: BorderRadius.circular(5)),
      child: Text(
        _dateString(date),
        style: AppTextStyles.getNormalText(
            fontSize: AppSize.s12, color: Theme.of(context).primaryColor),
      ),
    );
  }
}
