import 'package:flutter/material.dart';

class OptionBar extends StatelessWidget {
  final List<IconData> icons;
  final double width;
  final double height;
  final double borderRadius;

  const OptionBar({
    Key? key,
    required this.icons,
    required this.width,
    required this.height,
    this.borderRadius = 8.0, // Default radius is set to 0.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(0.0),
          topRight: const Radius.circular(0.0),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight:
              Radius.circular(borderRadius), // No radius at bottom right
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: icons
            .map((icon) => Icon(
                  icon,
                  size: 30,
                  color: Colors.black,
                ))
            .toList(),
      ),
    );
  }
}
