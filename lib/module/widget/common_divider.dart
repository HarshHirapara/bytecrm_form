import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({
    super.key,
    this.color,
    this.thickness,
    this.left,
    this.right,
    this.top,
    this.bottom,
  });
  final Color? color;
  final double? thickness;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 0,
        right: right ?? 0,
        top: top ?? 0,
        bottom: bottom ?? 0,
      ),
      child: Divider(color: color, thickness: thickness),
    );
  }
}
