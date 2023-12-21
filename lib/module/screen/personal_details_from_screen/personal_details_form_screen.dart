import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_icons.dart';
import 'package:bytecrm_form/core/constant/common_strings.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:bytecrm_form/module/widget/common_text_field.dart';
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
    // final screenHight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        border: Border.all(color: CommonColor.blue),
                      ),
                      child: const Center(
                        child: CommonText(
                          text: CommonString.profileMiddleName,
                          color: CommonColor.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
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
                          color: CommonColor.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [CommonColor.white, CommonColor.black],
                          ),
                        ),
                        child: Icon(
                          CommonIcon.camera.icon,
                          color: CommonColor.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  CommonTextField(
                    keyBoardType: TextInputType.text,
                    label: CommonString.fullName,
                    validator: (value) =>
                        value!.isEmpty ? 'Please Enter Name' : null,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: CommonString.countryNumberCode,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    borderSide:
                                        BorderSide(color: CommonColor.coffee),
                                  ),
                                ),
                              ),
                              Obx(
                                () => SizedBox(
                                  height: GetXProperties.numberIsNotValid.value
                                      ? 20
                                      : null,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: CommonTextField(
                          keyBoardType: TextInputType.phone,
                          label: CommonString.mobileNumber,
                          validator: (value) {
                            if (value!.isEmpty) {
                              GetXProperties.numberIsNotValid.value = true;
                              return 'Please enter mobile number';
                            } else if (value.length < 10) {
                              GetXProperties.numberIsNotValid.value = true;
                              return 'Mobile number must be 10 digits';
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
                      keyBoardType: TextInputType.emailAddress,
                      label: CommonString.emailId,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        } else {
                          if (RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return 'Email is not valid';
                          }
                        }
                      }),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CommonTextFieldWithIcon(
                              keyBoardType: TextInputType.datetime,
                              icon: CommonIcon.calender,
                              label: CommonString.birthDate,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  GetXProperties
                                      .anniversaryDateIsNotValid.value = true;
                                  return 'Please select birth date';
                                }
                                GetXProperties.anniversaryDateIsNotValid.value =
                                    false;
                                return null;
                              },
                            ),
                            Obx(
                              () => SizedBox(
                                height: GetXProperties.birthDateIsNotValid.value
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
                            CommonTextFieldWithIcon(
                              keyBoardType: TextInputType.datetime,
                              icon: CommonIcon.calender,
                              label: CommonString.anniversaryDate,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  GetXProperties.birthDateIsNotValid.value =
                                      true;
                                  return 'Please select anniversary date';
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
                              keyBoardType: TextInputType.text,
                              label: CommonString.designation,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  GetXProperties.roleIsNotValid.value = true;
                                  return 'please enter designation';
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
                              label: CommonString.role,
                              validator: (value) {
                                if (value == null) {
                                  GetXProperties.designationIsNotValid.value =
                                      true;
                                  return 'Please enter role';
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
                    label: CommonString.reportsTo,
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter report';
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
    );
  }
}

//  DateTime? datePicked = await showDatePicker(
//                   builder: (context, child) {
//                     return Theme(
//                         data: ThemeData(primarySwatch: Colors.pink),
//                         // data: Theme.of(context).copyWith(
//                         //   colorScheme: const ColorScheme.light(
//                         //     primary: Colors.blueGrey,
//                         //     onPrimary: Colors.black,
//                         //     onSurface: Colors.black,
//                         //   ),
//                         // ),
//                         child: child!);
//                   },
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime.now(),
//                 );
//                 if (datePicked != null) {
//                   setState(() {
//                     date = datePicked;
//                   });
//                 }