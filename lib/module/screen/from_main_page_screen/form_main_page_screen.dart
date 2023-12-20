import 'package:bytecrm_form/core/common_colors.dart';
import 'package:bytecrm_form/core/common_icons.dart';
import 'package:bytecrm_form/core/common_strings.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/module/widget/common_button.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../widget/common_form_steps.dart';

class FormMainPage extends StatelessWidget {
  const FormMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: CommonString.updateEmployee,
          color: CommonColor.black,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: CommonColor.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonFormStepCheck(
                        isFilled: (GetXProperties.currentPage.value > 0)
                            ? true
                            : false,
                        leftLine: false,
                        rightLine: true,
                      ),
                      (GetXProperties.currentPage.value >= 1)
                          ? CommonFormStepCheck(
                              isFilled: (GetXProperties.currentPage.value > 1)
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
                              isFilled: (GetXProperties.currentPage.value > 2)
                                  ? true
                                  : false,
                              leftLine: true,
                              rightLine: false)
                          : const CommonPageNumber(
                              pageNumber: CommonString.pageNumber3,
                              isFilled: false,
                              leftLine: true,
                              rightLine: false,
                            )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70),
                  child: SizedBox(
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: CommonString.personal,
                            color: (GetXProperties.currentPage.value == 0)
                                ? CommonColor.black
                                : CommonColor.coffee,
                            fontWeight: FontWeight.bold,
                          ),
                          CommonText(
                            text: CommonString.joining,
                            color: (GetXProperties.currentPage.value == 1)
                                ? CommonColor.black
                                : CommonColor.coffee,
                            fontWeight: FontWeight.bold,
                          ),
                          CommonText(
                            text: CommonString.other,
                            color: (GetXProperties.currentPage.value == 2)
                                ? CommonColor.black
                                : CommonColor.coffee,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                Container(
                  color: Colors.deepPurple,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.lightGreenAccent,
                )
              ],
              onPageChanged: (value) {
                GetXProperties.currentPage.value = value;
              },
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(top: 1, bottom: 4, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => (GetXProperties.currentPage.value == 0)
                    ? CommonButtonWithoutIcon(
                        onPressed: () {},
                        text: CommonString.cancelButton,
                        fontSize: 20,
                        color: CommonColor.coffee,
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.only(
                                left: 42, right: 42, top: 13, bottom: 13),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                              CommonColor.transparent),
                          elevation: const MaterialStatePropertyAll(0),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                width: 1.5, color: CommonColor.coffee),
                          ),
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      )
                    : CommonButtonWithIcon(
                        onPressed: () {
                          controller.previousPage(
                              duration: const Duration(microseconds: 1),
                              curve: Curves.bounceIn);
                        },
                        textDirection: TextDirection.ltr,
                        text: CommonString.backButton,
                        fontSize: 20,
                        color: CommonColor.coffee,
                        icon: Icon(
                          CommonIcon.back.icon,
                          size: 30,
                          color: CommonColor.coffee,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.only(
                                left: 25, right: 35, top: 10, bottom: 10),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                              CommonColor.transparent),
                          elevation: const MaterialStatePropertyAll(0),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                width: 1.5, color: CommonColor.coffee),
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                width: 10,
              ),
              Obx(
                () => (GetXProperties.currentPage.value == 2)
                    ? CommonButtonWithoutIcon(
                        onPressed: () {},
                        text: CommonString.done,
                        fontSize: 20,
                        color: CommonColor.white,
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.only(
                                left: 51, right: 51, top: 13, bottom: 13),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(CommonColor.transparent),
                          elevation: MaterialStatePropertyAll(0),
                        ),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CommonColor.buttonColor3,
                              CommonColor.buttonColor2,
                              CommonColor.buttonColor1,
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      )
                    : CommonButtonWithIcon(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(microseconds: 1),
                              curve: Curves.bounceIn);
                        },
                        textDirection: TextDirection.rtl,
                        text: CommonString.nextButton,
                        fontSize: 20,
                        color: CommonColor.white,
                        icon: Icon(
                          CommonIcon.back.icon,
                          size: 30,
                          color: CommonColor.white,
                        ),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CommonColor.buttonColor3,
                              CommonColor.buttonColor2,
                              CommonColor.buttonColor1,
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                            EdgeInsets.only(
                                left: 40, right: 30, top: 10, bottom: 10),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(CommonColor.transparent),
                          elevation: MaterialStatePropertyAll(0),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
