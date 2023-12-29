import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_icons.dart';
import 'package:bytecrm_form/core/constant/common_strings.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/module/screen/from_main_page_screen/main_form_screen.dart';
import 'package:bytecrm_form/module/widget/Common_user_detail_card.dart';
import 'package:bytecrm_form/module/widget/common_divider.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:bytecrm_form/module/widget/common_user_profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({
    super.key,
    required this.index,
    required this.userId,
    required this.fullName,
    required this.userImage,
    required this.email,
    required this.mobile,
    required this.birthDate,
    required this.anniversaryDate,
    required this.designation,
    required this.role,
    required this.reportsTo,
    required this.joiningDate,
    required this.employmentTime,
    required this.workingHours,
    required this.sliderValue,
  });
  final int index;
  final int userId;
  final String fullName;
  final String userImage;
  final String email;
  final String mobile;
  final String birthDate;
  final String anniversaryDate;
  final String designation;
  final String role;
  final String reportsTo;
  final String joiningDate;
  final String employmentTime;
  final String workingHours;
  final double sliderValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CommonText(text: fullName),
        backgroundColor: CommonColors.blue,
        actions: [
          IconButton(
            onPressed: () {
              GetXProperties.insertDataOrUpdateData.value = false;
              GetXProperties.fullName.text = fullName;
              GetXProperties.userImage.value = userImage;
              GetXProperties.mobileNumber.text = mobile;
              GetXProperties.email.text = email;
              GetXProperties.birthDate.text = birthDate;
              GetXProperties.anniversaryDate.text = anniversaryDate;
              GetXProperties.designation.text = designation;
              GetXProperties.dropDownRole = role;
              GetXProperties.dropDownReportTo = reportsTo;
              GetXProperties.joiningDate.text = joiningDate;
              GetXProperties.employmentTime.text = employmentTime;
              GetXProperties.workingHours.value = workingHours;
              GetXProperties.currentPage.value = 0;
              //employment time
              GetXProperties.employmentTime.text == CommonString.fullTime
                  ? GetXProperties.fullTime.value = true
                  : GetXProperties.fullTime.value = false;
              // GetXProperties.fullTime.value = true;
              // GetXProperties.profileImage.value = '';
              GetXProperties.workingHourPerDay.value = sliderValue;
              // GetXProperties.totalHours.value = '';
              // GetXProperties.totalMinutes.value = '';
              Get.to(() => FormMainPage(
                    userIdForUpdate: userId,
                  ));
            },
            icon: CommonIcon.edit,
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                userImage.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: CommonUserProfilePhoto(
                            radius: 60, userImage: userImage),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: CommonUserProfileWithoutImage(
                          fullName: fullName,
                          hight: 120,
                          width: 120,
                          fontSize: 60,
                        ),
                      ),
                CommonText(
                  text: '${index + 1} | $fullName',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: CommonText(
                    text: email,
                    fontSize: 20,
                  ),
                ),
                const CommonDivider(
                  top: 10,
                  bottom: 10,
                  thickness: 2,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: CommonColors.gray,
                        elevation: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      CommonIcon.person,
                                      SizedBox(width: 5),
                                      CommonText(
                                        text: CommonString.personalDetails,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                const CommonDivider(
                                  thickness: 1,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.fullName,
                                  titleData: fullName,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.emailId,
                                  titleData: email,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.mobileNumber,
                                  titleData: mobile,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: CommonColors.gray,
                        elevation: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      CommonIcon.calender,
                                      SizedBox(width: 5),
                                      CommonText(
                                        text: CommonString.date,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                const CommonDivider(
                                  thickness: 1,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.birthDate,
                                  titleData: birthDate,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.anniversaryDate,
                                  titleData: anniversaryDate,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.joiningDate,
                                  titleData: joiningDate,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: CommonColors.gray,
                        elevation: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      CommonIcon.work,
                                      SizedBox(width: 5),
                                      CommonText(
                                        text: CommonString.workingHourPerDay,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                const CommonDivider(
                                  thickness: 1,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.employmentTime,
                                  titleData: employmentTime,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.workingHourPerDay,
                                  titleData: workingHours,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: CommonColors.gray,
                        elevation: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      CommonIcon.star,
                                      SizedBox(width: 5),
                                      CommonText(
                                        text: CommonString.other,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                const CommonDivider(
                                  thickness: 1,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.designation,
                                  titleData: designation,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.role,
                                  titleData: role,
                                ),
                                CommonUserDetailsRichText(
                                  hadingTitle: CommonString.reportsTo,
                                  titleData: reportsTo,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
