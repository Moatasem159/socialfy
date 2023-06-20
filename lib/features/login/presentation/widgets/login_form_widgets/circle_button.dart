import 'package:flutter/material.dart';
class CircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  const CircleButton({super.key, required this.onTap, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:onTap,
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(color),
            fixedSize:
            MaterialStateProperty.all(const Size(50, 50)),
            shape:
            MaterialStateProperty.all(const CircleBorder())),
        child: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ));
  }
}