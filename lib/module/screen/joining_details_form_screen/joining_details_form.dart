import 'dart:developer';

import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_strings.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/module/widget/common_button.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:bytecrm_form/module/widget/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoiningDetailsFormScreen extends StatelessWidget {
  const JoiningDetailsFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: CommonTextFieldForDate(
                controller: GetXProperties.joiningDate,
                lastDate: DateTime(2025),
                label: CommonString.joiningDate,
                validator: (value) {
                  if (value!.isEmpty) {
                    return CommonString.selectJoiningDate;
                  }
                  return null;
                },
                keyBoardType: TextInputType.datetime,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 25, bottom: 10),
              child: CommonText(
                text: CommonString.employmentTime,
                color: CommonColors.coffee,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Obx(
                () => Row(
                  children: [
                    CommonButtonWithoutIcon(
                      onPressed: () {
                        GetXProperties.fullTime.value = true;
                        GetXProperties.employmentTime.text =
                            CommonString.fullTime;
                      },
                      height: 40,
                      width: 150,
                      text: CommonString.fullTime,
                      color: GetXProperties.fullTime.value
                          ? CommonColors.white
                          : CommonColors.black,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          GetXProperties.fullTime.value
                              ? CommonColors.blue
                              : CommonColors.transparent,
                        ),
                        elevation: const MaterialStatePropertyAll(0),
                      ),
                      decoration: BoxDecoration(
                        color: GetXProperties.fullTime.value
                            ? CommonColors.blue
                            : CommonColors.transparent,
                        border: Border.all(
                          color: GetXProperties.fullTime.value
                              ? CommonColors.blue
                              : CommonColors.coffee,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                    ),
                    CommonButtonWithoutIcon(
                      onPressed: () {
                        GetXProperties.fullTime.value = false;
                        GetXProperties.employmentTime.text =
                            CommonString.partTime;
                      },
                      height: 40,
                      width: 150,
                      text: CommonString.partTime,
                      color: GetXProperties.fullTime.value
                          ? CommonColors.black
                          : CommonColors.white,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          GetXProperties.fullTime.value
                              ? CommonColors.transparent
                              : CommonColors.blue,
                        ),
                        elevation: const MaterialStatePropertyAll(0),
                      ),
                      decoration: BoxDecoration(
                        color: GetXProperties.fullTime.value
                            ? CommonColors.transparent
                            : CommonColors.blue,
                        border: Border.all(
                          color: GetXProperties.fullTime.value
                              ? CommonColors.coffee
                              : CommonColors.blue,
                        ),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 55, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CommonText(
                    text: CommonString.workingHourPerDay,
                    color: CommonColors.coffee,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  Obx(
                    () => Row(
                      children: [
                        CommonText(
                          text: GetXProperties.totalHours.isNotEmpty
                              ? GetXProperties.totalHours.toString() +
                                  GetXProperties.totalMinutes.toString()
                              : '00:00',
                          color: CommonColors.orange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        const CommonText(
                          text: CommonString.hr,
                          color: CommonColors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Obx(
                () => Slider(
                  value: GetXProperties.workingHourPerDay.value,
                  max: 1440,
                  onChanged: (value) {
                    GetXProperties.workingHourPerDay.value = value;
                    ((GetXProperties.workingHourPerDay.value / 60) < 12)
                        ? GetXProperties.fullTime.value = false
                        : GetXProperties.fullTime.value = true;
                    ((GetXProperties.workingHourPerDay.value / 60) < 12)
                        ? GetXProperties.employmentTime.text =
                            CommonString.partTime
                        : GetXProperties.employmentTime.text =
                            CommonString.fullTime;

                    GetXProperties.totalHours.value = (GetXProperties
                                    .workingHourPerDay.value ~/
                                60) <
                            10
                        ? '0${GetXProperties.workingHourPerDay.value ~/ 60}:'
                        : '${GetXProperties.workingHourPerDay.value ~/ 60}:';

                    GetXProperties.totalMinutes
                        .value = (GetXProperties.workingHourPerDay.value % 60) <
                            10
                        ? '0${(GetXProperties.workingHourPerDay.value % 60).toInt()}'
                        : '${(GetXProperties.workingHourPerDay.value % 60).toInt()}';

                    GetXProperties.workingHours.text =
                        GetXProperties.totalHours.toString() +
                            GetXProperties.totalMinutes.toString();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
