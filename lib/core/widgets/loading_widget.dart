import 'package:flutter/material.dart';
class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({Key? key, this.size=70}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
        strokeWidth: .8,
      ),
    );
  }
}