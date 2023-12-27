import 'dart:io';
import 'dart:ui';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:flutter/material.dart';
import '../../core/constant/common_colors.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final String fullNamFirstLater =
        ('${GetXProperties.usersData[index]['full_name'][0]}').toUpperCase();
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CommonColors.buttonColor1,
              CommonColors.buttonColor2,
              CommonColors.buttonColor3
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetXProperties.usersData[index]['user_image'].isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                CommonColors.buttonColor1,
                                CommonColors.buttonColor2,
                                CommonColors.buttonColor3
                              ])),
                      child: Center(
                        child: Text(
                          fullNamFirstLater,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(
                        File(GetXProperties.usersData[index]['user_image']),
                      ),
                    ),
                  ),
            CommonText(
              text:
                  '${GetXProperties.usersData[index]['id']} | ${GetXProperties.usersData[index]['full_name']}',
              color: CommonColors.black,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            CommonText(
              text: '${GetXProperties.usersData[index]['email']}',
              color: CommonColors.black,
              fontSize: 10,
            ),
          ],
        ),
      ),
    );
    // );
  }
}
