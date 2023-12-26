import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_icons.dart';
import 'package:bytecrm_form/core/constant/common_strings.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/core/sql_databse/sql_handler.dart';
import 'package:bytecrm_form/module/screen/joining_details_form_screen/joining_details_form.dart';
import 'package:bytecrm_form/module/screen/personal_details_from_screen/personal_details_form_screen.dart';
import 'package:bytecrm_form/module/widget/common_button.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widget/common_form_steps.dart';

class FormMainPage extends StatelessWidget {
  const FormMainPage({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final PageController controller = PageController();
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: const CommonText(
            text: CommonString.updateEmployee,
            color: CommonColors.black,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: CommonColors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: Column(
                  children: [
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: GetXProperties.currentPage.value == 2
                                  ? 8
                                  : null),
                          Column(
                            children: [
                              CommonFormStepCheck(
                                isFilled: (GetXProperties.currentPage.value > 0)
                                    ? true
                                    : false,
                                leftLine: false,
                                rightLine: true,
                              ),
                            ],
                          ),
                          (GetXProperties.currentPage.value >= 1)
                              ? CommonFormStepCheck(
                                  isFilled:
                                      (GetXProperties.currentPage.value > 1)
                                          ? true
                                          : false,
                                  leftLine: true,
                                  rightLine: true)
                              : const CommonPageNumber(
                                  pageNumber: CommonString.pageNumber2,
                                  isFilled: false,
                                  leftLine: true,
                                  rightLine: true,
                                ),
                          (GetXProperties.currentPage.value >= 2)
                              ? CommonFormStepCheck(
                                  isFilled: (GetXProperties.currentPage.value >
                                              2 ||
                                          GetXProperties.pageThreeIsDone.value)
                                      ? true
                                      : false,
                                  leftLine: true,
                                  rightLine: false,
                                )
                              : const CommonPageNumber(
                                  pageNumber: CommonString.pageNumber3,
                                  isFilled: false,
                                  leftLine: true,
                                  rightLine: false,
                                )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 106,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: CommonString.personal,
                                  color: (GetXProperties.currentPage.value == 0)
                                      ? CommonColors.black
                                      : CommonColors.coffee,
                                  fontWeight: FontWeight.bold,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: CommonText(
                                    text: CommonString.details,
                                    color:
                                        (GetXProperties.currentPage.value == 0)
                                            ? CommonColors.black
                                            : CommonColors.coffee,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            width: 106,
                            child: Column(
                              children: [
                                CommonText(
                                  text: CommonString.joining,
                                  color: (GetXProperties.currentPage.value == 1)
                                      ? CommonColors.black
                                      : CommonColors.coffee,
                                  fontWeight: FontWeight.bold,
                                ),
                                CommonText(
                                  text: CommonString.details,
                                  color: (GetXProperties.currentPage.value == 1)
                                      ? CommonColors.black
                                      : CommonColors.coffee,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 106,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: CommonText(
                                    text: CommonString.other,
                                    color:
                                        (GetXProperties.currentPage.value == 2)
                                            ? CommonColors.black
                                            : CommonColors.coffee,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CommonText(
                                  text: CommonString.details,
                                  color: (GetXProperties.currentPage.value == 2)
                                      ? CommonColors.black
                                      : CommonColors.coffee,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    GetXProperties.currentPage.value = value;
                  },
                  children: [
                    const PersonalDetailsFormScreen(),
                    const JoiningDetailsFormScreen(),
                    Container(color: CommonColors.blue)
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 4, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => (GetXProperties.currentPage.value == 0)
                      ? CommonButtonWithoutIcon(
                          height: 55,
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Get.back();
                          },
                          text: CommonString.cancelButton,
                          fontSize: 20,
                          color: CommonColors.coffee,
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.only(
                                  left: 41, right: 41, top: 12, bottom: 12),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                                CommonColors.transparent),
                            elevation: MaterialStatePropertyAll(0),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.5, color: CommonColors.coffee),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                        )
                      : CommonButtonWithIcon(
                          height: 55,
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            controller.previousPage(
                              duration: const Duration(microseconds: 1),
                              curve: Curves.bounceIn,
                            );
                            GetXProperties.pageThreeIsDone.value = false;
                          },
                          textDirection: TextDirection.ltr,
                          text: CommonString.backButton,
                          fontSize: 20,
                          color: CommonColors.coffee,
                          icon: Icon(
                            CommonIcon.back.icon,
                            size: 30,
                            color: CommonColors.coffee,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.5, color: CommonColors.coffee),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.only(
                                  left: 24, right: 34, top: 9, bottom: 9),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                                CommonColors.transparent),
                            elevation: MaterialStatePropertyAll(0),
                          ),
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Obx(
                  () => (GetXProperties.currentPage.value == 2)
                      ? CommonButtonWithoutIcon(
                          height: 55,
                          onPressed: () async {
                            GetXProperties.pageThreeIsDone.value = true;
                            FocusManager.instance.primaryFocus?.unfocus();
                            await SQlDatabaseHandler.insertData(
                              GetXProperties.userImage.text,
                              GetXProperties.fullName.text,
                              GetXProperties.mobileNumber.text,
                              GetXProperties.email.text,
                              GetXProperties.birthDate.text,
                              GetXProperties.anniversaryDate.text,
                              GetXProperties.designation.text,
                              GetXProperties.role.text,
                              GetXProperties.reportsTo.text,
                              GetXProperties.joiningDate.text,
                              GetXProperties.employmentTime.text,
                              GetXProperties.workingHours.text,
                            );
                          },
                          text: CommonString.done,
                          fontSize: 20,
                          color: CommonColors.white,
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.only(
                                  left: 51, right: 51, top: 13, bottom: 13),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                                CommonColors.transparent),
                            elevation: MaterialStatePropertyAll(0),
                          ),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                CommonColors.buttonColor3,
                                CommonColors.buttonColor2,
                                CommonColors.buttonColor1,
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                        )
                      : CommonButtonWithIcon(
                          height: 55,
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (formKey.currentState!.validate()) {
                              if (GetXProperties.currentPage.value == 1) {
                                if (GetXProperties.workingHourPerDay.value !=
                                    0) {
                                  GetXProperties.employmentTime.text =
                                      CommonString.fullTime;
                                  controller.nextPage(
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.bounceIn,
                                  );
                                } else {
                                  Get.snackbar(
                                    CommonString.snackBarTitle,
                                    CommonString.snackBarMessage,
                                    backgroundColor: CommonColors.blue,
                                  );
                                }
                              } else {
                                controller.nextPage(
                                  duration: const Duration(microseconds: 1),
                                  curve: Curves.bounceIn,
                                );
                                GetXProperties.pageThreeIsDone.value = false;
                              }
                            }
                          },
                          textDirection: TextDirection.rtl,
                          text: CommonString.nextButton,
                          fontSize: 20,
                          color: CommonColors.white,
                          icon: Icon(
                            CommonIcon.back.icon,
                            size: 30,
                            color: CommonColors.white,
                          ),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                CommonColors.buttonColor3,
                                CommonColors.buttonColor2,
                                CommonColors.buttonColor1,
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                          style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.only(
                                  left: 40, right: 30, top: 10, bottom: 10),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                                CommonColors.transparent),
                            elevation: MaterialStatePropertyAll(0),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
