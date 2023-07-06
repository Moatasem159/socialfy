import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/values_manager.dart';
class MessageDateWidget extends StatelessWidget {
  final String date;
  const MessageDateWidget({super.key, required this.date});
  String dateString(String date){
    DateTime dateTime = DateTime.parse(date);
    String result;
    if(DateTime.now().difference(dateTime).inDays==0){
      result = 'Today';
    }
    else if(DateTime.now().difference(dateTime).inDays==1)
    {
      result = 'Yesterday';
    }
    else if (DateTime.now().difference(dateTime).inDays<5){
      result = DateFormat('EEEE').format(dateTime);
    } else{
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
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(5)
      ),
      child: Text(
        dateString(date),
        style: AppTextStyles.getNormalText(fontSize: AppSize.s12, color: Theme.of(context).primaryColor),
      ),
    );
  }
}