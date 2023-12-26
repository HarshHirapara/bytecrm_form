import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_strings.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/module/widget/common_button.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:bytecrm_form/module/widget/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
                color: CommonColor.coffee,
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
                      },
                      height: 40,
                      width: 150,
                      text: CommonString.fullTime,
                      color: GetXProperties.fullTime.value
                          ? CommonColor.white
                          : CommonColor.black,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            GetXProperties.fullTime.value
                                ? CommonColor.blue
                                : CommonColor.transparent),
                        elevation: const MaterialStatePropertyAll(0),
                      ),
                      decoration: BoxDecoration(
                        color: GetXProperties.fullTime.value
                            ? CommonColor.blue
                            : CommonColor.transparent,
                        border: Border.all(
                          color: GetXProperties.fullTime.value
                              ? CommonColor.blue
                              : CommonColor.coffee,
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                      ),
                    ),
                    CommonButtonWithoutIcon(
                      onPressed: () {
                        GetXProperties.fullTime.value = false;
                      },
                      height: 40,
                      width: 150,
                      text: CommonString.partTime,
                      color: GetXProperties.fullTime.value
                          ? CommonColor.black
                          : CommonColor.white,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            GetXProperties.fullTime.value
                                ? CommonColor.transparent
                                : CommonColor.blue),
                        elevation: const MaterialStatePropertyAll(0),
                      ),
                      decoration: BoxDecoration(
                        color: GetXProperties.fullTime.value
                            ? CommonColor.transparent
                            : CommonColor.blue,
                        border: Border.all(
                          color: GetXProperties.fullTime.value
                              ? CommonColor.coffee
                              : CommonColor.blue,
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
                    color: CommonColor.coffee,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  Obx(
                    () => Row(
                      children: [
                        CommonText(
                          text: ((GetXProperties.workingHours.value ~/ 60) < 10)
                              ? '0${GetXProperties.workingHours.value ~/ 60}:'
                              : '${GetXProperties.workingHours.value ~/ 60}:',
                          color: CommonColor.orange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        CommonText(
                          text: (GetXProperties.workingHours.value % 60) == 0
                              ? '0${(GetXProperties.workingHours.value % 60).toInt()}'
                              : '${(GetXProperties.workingHours.value % 60).toInt()}',
                          color: CommonColor.orange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        const CommonText(
                          text: CommonString.hr,
                          color: CommonColor.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
                  value: GetXProperties.workingHours.value,
                  max: 1440,
                  onChanged: (value) {
                    GetXProperties.workingHours.value = value;
                    ((GetXProperties.workingHours.value / 60) < 12)
                        ? GetXProperties.fullTime.value = false
                        : GetXProperties.fullTime.value = true;
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
