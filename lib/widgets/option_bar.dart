import 'package:flutter/material.dart';

class OptionBar extends StatelessWidget {
  final List<IconData> icons;
  final List<Function()> onTapFunctions;
  final double width;
  final double height;
  final Color backgroundColor;

  const OptionBar({
    Key? key,
    required this.icons,
    required this.onTapFunctions,
    required this.width,
    required this.height,
    required this.backgroundColor, // Tambahkan parameter backgroundColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Gunakan Container sebagai wrapper
      width: width,
      height: height,
      color: Colors.white, // Tetapkan warna latar belakang Container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          icons.length,
          (index) {
            return IconButton(
              onPressed:
                  onTapFunctions.length > index ? onTapFunctions[index] : null,
              icon: Icon(icons.length > index ? icons[index] : Icons.error),
              iconSize: 36,
              color: Colors.black,
            );
          },
        ),
      ),
    );
  }
}
