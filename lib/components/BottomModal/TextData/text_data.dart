import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  const TextData({
    super.key,
    this.title,
    this.description,
  });

  final String? title, description;

  final titleTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  final desTextStyle = const TextStyle(
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? "No title given",
            style: titleTextStyle,
          ),
          Text(
            description ?? "No description given",
            style: desTextStyle,
          ),
        ],
      ),
    );
  }
}
