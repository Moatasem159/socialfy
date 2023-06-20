import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
class ToastWidget extends StatelessWidget {
  final String msg;
  const ToastWidget({Key? key,required this.msg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color:Theme.of(context).primaryColor),
      child: Text(msg,
          textAlign: TextAlign.center,
          style: AppTextStyles.getNormalText(fontSize: 14,color:Theme.of(context).primaryColorLight)),
    );
  }
}