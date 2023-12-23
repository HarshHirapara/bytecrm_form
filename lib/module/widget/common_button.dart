import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:flutter/material.dart';

class CommonButtonWithIcon extends StatelessWidget {
  const CommonButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.text,
    required this.style,
    required this.textDirection,
    required this.icon,
    this.color,
    this.fontSize,
    this.fontWeight,
    required this.decoration,
    this.width,
    this.height,
  });

  final void Function() onPressed;
  final String text;
  final ButtonStyle style;
  final TextDirection textDirection;
  final Icon icon;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Decoration decoration;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration,
      child: Directionality(
        textDirection: textDirection,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: style,
          icon: icon,
          label: CommonText(
            text: text,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

class CommonButtonWithoutIcon extends StatelessWidget {
  const CommonButtonWithoutIcon({
    super.key,
    required this.onPressed,
    required this.text,
    required this.style,
    required this.decoration,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.height,
  });

  final void Function() onPressed;
  final String text;
  final ButtonStyle style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Decoration decoration;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: CommonText(
          text: text,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
// OutlinedButton(
//       style: ButtonStyle(
//         shape: MaterialStateProperty.all(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         side: MaterialStateProperty.all(
//           BorderSide(color: CommonColors.blue),
//         ),
//       ),
//       onPressed: onPressed,
//       child: CommonText(
//         title: buttonName,
//         color: CommonColors.blue,
//         fontSize: 15,
//         fontWight: FontWeight.bold,
//         topPadding: 13,
//         bottomPadding: 13,
//       ),
//     );