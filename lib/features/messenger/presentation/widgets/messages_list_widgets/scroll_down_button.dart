import 'package:flutter/material.dart';
class ScrollDownButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isDown;
  const ScrollDownButton({super.key, required this.onTap, required this.isDown});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      right: 15,
      child: AnimatedOpacity(
        opacity: isDown?1:0,
        duration: const Duration(milliseconds: 150),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle
            ),
            child:Icon(Icons.keyboard_double_arrow_down_rounded,color: Theme.of(context).colorScheme.background),
          ),
        ),
      ),
    );
  }
}