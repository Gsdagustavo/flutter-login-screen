import 'package:flutter/material.dart';

import '../schemes/app_colorscheme.dart';

class AnimatedHeartIcon extends StatefulWidget {
  const AnimatedHeartIcon({super.key});

  @override
  State<AnimatedHeartIcon> createState() => _AnimatedHeartIconState();
}

class _AnimatedHeartIconState extends State<AnimatedHeartIcon>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  late double size;

  @override
  void initState() {
    super.initState();
    size = 50;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener((() {
        setState(() {
          size = 50 + animation.value * 0.15;
        });
      }));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColors.colorScheme;
    return GestureDetector(
      onTap: () {
        controller.status == AnimationStatus.completed
            ? controller.reverse()
            : controller.forward();
      },

      child: Icon(Icons.favorite, color: colorScheme.primary, size: size),
    );
  }
}