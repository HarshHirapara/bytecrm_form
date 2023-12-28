import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/module/screen/user_details_page_screen/user_details_page_screen.dart';
import 'package:bytecrm_form/module/widget/common_divider.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:bytecrm_form/module/widget/common_user_profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/common_colors.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => UserDetailsPage(
            index: index,
            fullName: GetXProperties.usersData[index]['full_name'],
            userImage: GetXProperties.usersData[index]['user_image'],
            email: GetXProperties.usersData[index]['email'],
            mobile: GetXProperties.usersData[index]['mobile_number'],
            birthDate: GetXProperties.usersData[index]['birth_date'],
            anniversaryDate: GetXProperties.usersData[index]
                ['anniversary_date'],
            designation: GetXProperties.usersData[index]['designation'],
            role: GetXProperties.usersData[index]['role'],
            reportsTo: GetXProperties.usersData[index]['reports_to'],
            joiningDate: GetXProperties.usersData[index]['joining_date'],
            employmentTime: GetXProperties.usersData[index]['employment_time'],
            workingHours: GetXProperties.usersData[index]['working_hour'],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          color: CommonColors.transparent,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade100,
                  Colors.blue.shade200,
                  Colors.blue.shade300,
                  Colors.blue.shade400,
                  Colors.blue.shade500,
                  Colors.blue.shade600,
                  Colors.blue.shade700,
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetXProperties.usersData[index]['user_image'].isEmpty
                    ? CommonUserProfileWithoutImage(
                        fullName: GetXProperties.usersData[index]['full_name'],
                        hight: 80,
                        width: 80,
                        fontSize: 40,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: CommonUserProfilePhoto(
                            radius: 40,
                            userImage: GetXProperties.usersData[index]
                                ['user_image']),
                      ),
                const CommonDivider(
                  color: CommonColors.black,
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                CommonText(
                  text:
                      '${GetXProperties.usersData[index]['id']} | ${GetXProperties.usersData[index]['full_name']}',
                  color: CommonColors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
                CommonText(
                  text: '${GetXProperties.usersData[index]['email']}',
                  color: CommonColors.black,
                  fontSize: 13,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // );
  }
}
