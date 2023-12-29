import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_icons.dart';
import 'package:bytecrm_form/core/constant/common_strings.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:bytecrm_form/module/widget/common_text_field.dart';
import 'package:bytecrm_form/module/widget/common_user_profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class PersonalDetailsFormScreen extends StatefulWidget {
  const PersonalDetailsFormScreen({super.key});

  @override
  State<PersonalDetailsFormScreen> createState() =>
      _PersonalDetailsFormScreenState();
}

class _PersonalDetailsFormScreenState extends State<PersonalDetailsFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      GetXProperties.pickProfileImage();
                    },
                    child: Stack(
                      children: [
                        Obx(
                          () => GetXProperties.userImage.isNotEmpty
                              ? CommonUserProfilePhoto(
                                  radius: 60,
                                  userImage:
                                      GetXProperties.userImage.value.toString(),
                                )
                              : Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                    border:
                                        Border.all(color: CommonColors.blue),
                                  ),
                                  child: const Center(
                                    child: CommonText(
                                      text: CommonString.profileMiddleName,
                                      color: CommonColors.blue,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                        Positioned(
                          top: 85,
                          left: 85,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: CommonColors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  CommonColors.white,
                                  CommonColors.black
                                ],
                              ),
                            ),
                            child: Icon(
                              CommonIcon.camera.icon,
                              color: CommonColors.white,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    CommonTextField(
                      controller: GetXProperties.fullName,
                      keyBoardType: TextInputType.text,
                      label: CommonString.fullName,
                      validator: (value) =>
                          value!.isEmpty ? CommonString.enterName : null,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: CommonString.countryNumberCode,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      borderSide: BorderSide(
                                          color: CommonColors.coffee),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: CommonTextField(
                            controller: GetXProperties.mobileNumber,
                            maxLength: 10,
                            keyBoardType: TextInputType.phone,
                            label: CommonString.mobileNumber,
                            validator: (value) {
                              if (value!.isEmpty) {
                                GetXProperties.numberIsNotValid.value = true;
                                return CommonString.enterMobileNumber;
                              } else if (value.length < 10) {
                                GetXProperties.numberIsNotValid.value = true;
                                return CommonString.mobileMustBe10Digits;
                              } else {
                                GetXProperties.numberIsNotValid.value = false;
                                return null;
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    CommonTextField(
                        controller: GetXProperties.email,
                        keyBoardType: TextInputType.emailAddress,
                        label: CommonString.emailId,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return CommonString.enterEmail;
                          } else {
                            if (RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return CommonString.emailNotValid;
                            }
                          }
                        }),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CommonTextFieldForDate(
                                controller: GetXProperties.birthDate,
                                lastDate: DateTime.now(),
                                keyBoardType: TextInputType.datetime,
                                label: CommonString.birthDate,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    GetXProperties
                                        .anniversaryDateIsNotValid.value = true;
                                    return CommonString.selectBirthDate;
                                  }
                                  GetXProperties
                                      .anniversaryDateIsNotValid.value = false;
                                  return null;
                                },
                              ),
                              Obx(
                                () => SizedBox(
                                  height:
                                      GetXProperties.birthDateIsNotValid.value
                                          ? 20
                                          : null,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CommonTextFieldForDate(
                                controller: GetXProperties.anniversaryDate,
                                lastDate: DateTime(2025),
                                keyBoardType: TextInputType.datetime,
                                label: CommonString.anniversaryDate,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    GetXProperties.birthDateIsNotValid.value =
                                        true;
                                    return CommonString.selectAnniversaryDate;
                                  }
                                  GetXProperties.birthDateIsNotValid.value =
                                      false;
                                  return null;
                                },
                              ),
                              Obx(
                                () => SizedBox(
                                  height: GetXProperties
                                          .anniversaryDateIsNotValid.value
                                      ? 20
                                      : null,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CommonTextField(
                                controller: GetXProperties.designation,
                                keyBoardType: TextInputType.text,
                                label: CommonString.designation,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    GetXProperties.roleIsNotValid.value = true;
                                    return CommonString.enterDesignation;
                                  }
                                  GetXProperties.roleIsNotValid.value = false;
                                  return null;
                                },
                              ),
                              Obx(
                                () => SizedBox(
                                  height:
                                      GetXProperties.designationIsNotValid.value
                                          ? 20
                                          : null,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CommonDropDownButtonTextFiled(
                                value: GetXProperties.dropDownRole,
                                onChanged: (String? value) {
                                  GetXProperties.dropDownRole = value;
                                },
                                label: CommonString.role,
                                validator: (value) {
                                  if (value == null) {
                                    GetXProperties.designationIsNotValid.value =
                                        true;
                                    return CommonString.selectRole;
                                  }
                                  GetXProperties.designationIsNotValid.value =
                                      false;
                                  return null;
                                },
                              ),
                              Obx(
                                () => SizedBox(
                                  height: GetXProperties.roleIsNotValid.value
                                      ? 20
                                      : null,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    CommonDropDownButtonTextFiled(
                      value: GetXProperties.dropDownReportTo,
                      onChanged: (String? value) {
                        GetXProperties.dropDownReportTo = value;
                      },
                      label: CommonString.reportsTo,
                      validator: (value) {
                        if (value == null) {
                          return CommonString.selectReport;
                        }
                        return null;
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
