import 'package:flutter/material.dart';
class ProfileInfo extends StatelessWidget{
  final String title;
  final int count;
  const ProfileInfo({super.key, required this.title, required this.count});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            "$count",
            style:
            Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style:
            Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}