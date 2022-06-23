import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  const CustomIconButton({
    Key? key, 
    required this.radius, 
    required this.iconData, 
    required this.onTap,
    this.color,
  }) : super(key: key);

  final double radius;
  final IconData iconData;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child : Material(
        color: Colors.transparent,
        child : InkWell(
          onTap: onTap,
          child : Icon(iconData, color: color),
        ),
      ),
    );
  }
}