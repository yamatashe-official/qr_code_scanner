import 'package:flutter/material.dart';

class DisplayData extends StatelessWidget {
  const DisplayData({
    super.key,
    this.constraints,
    this.data,
  });

  final BoxConstraints? constraints;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (constraints?.biggest.width ?? 0),
      height: ((constraints?.biggest.height ?? 0) * 0.4),
      child: Center(
          child: Text(
        data ?? "No Data provided",
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      )),
    );
  }
}
