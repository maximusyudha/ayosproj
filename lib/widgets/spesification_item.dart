import 'package:flutter/material.dart';

class ItemSpecification extends StatelessWidget {
  final String title;
  final List<String> specifications;

  const ItemSpecification({
    Key? key,
    required this.title,
    required this.specifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: specifications
                .map((specification) => ListTile(
                      dense: true, // Menambahkan dense untuk mengurangi jarak
                      title: Text(specification),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
