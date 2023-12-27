import 'dart:developer';
import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_strings.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/core/sql_databse/sql_handler.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:bytecrm_form/module/widget/common_user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/common_icons.dart';
import '../from_main_page_screen/main_form_screen.dart';

class UserCardsHomeScreen extends StatefulWidget {
  const UserCardsHomeScreen({super.key});

  @override
  State<UserCardsHomeScreen> createState() => _UserCardsHomeScreenState();
}

class _UserCardsHomeScreenState extends State<UserCardsHomeScreen> {
  Future refreshData() async {
    final data = await SQlDatabaseHandler.getData();
    GetXProperties.usersData.assignAll(data);
    log(GetXProperties.usersData.toString());
    log(GetXProperties.usersData.length.toString());
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: CommonString.userCards,
        ),
        backgroundColor: CommonColors.blue,
        elevation: 0,
      ),
      body: Obx(
        () => GridView.builder(
          itemCount: GetXProperties.usersData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return UserCard(index: index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CommonColors.blue,
        onPressed: () {
          Get.to(() => const FormMainPage());
        },
        child: Icon(
          CommonIcon.addUser.icon,
          size: 35,
        ),
      ),
    );
  }
}
