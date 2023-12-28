import 'dart:io';
import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:flutter/material.dart';

class CommonUserProfilePhoto extends StatelessWidget {
  const CommonUserProfilePhoto({
    super.key,
    required this.radius,
    required this.userImage,
  });
  final double radius;
  final String userImage;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: CommonColors.transparent,
      backgroundImage: FileImage(
        File(userImage),
      ),
    );
  }
}

class CommonUserProfileWithoutImage extends StatelessWidget {
  const CommonUserProfileWithoutImage({
    super.key,
    required this.fullName,
    required this.hight,
    required this.width,
    required this.fontSize,
  });
  final String fullName;
  final double fontSize;
  final double hight;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              CommonColors.blueShade100,
              CommonColors.blueShade200,
              CommonColors.blueShade300,
              CommonColors.blueShade400,
              CommonColors.blueShade500,
              CommonColors.blueShade600,
              CommonColors.blueShade700
            ],
          ),
        ),
        child: Center(
          child: Text(
            fullName[0].toUpperCase(),
            style: TextStyle(fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
