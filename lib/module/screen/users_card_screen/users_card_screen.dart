import 'dart:developer';

import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_icons.dart';
import 'package:bytecrm_form/core/constant/common_strings.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/core/sql_databse/sql_handler.dart';
import 'package:bytecrm_form/module/screen/from_main_page_screen/main_form_screen.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCards extends StatefulWidget {
  const UserCards({super.key});

  @override
  State<UserCards> createState() => _UserCardsState();
}

class _UserCardsState extends State<UserCards> {
  Future refreshData() async {
    final data = await SQlDatabaseHandler.getData();
    GetXProperties.usersData.assignAll(data);
    log(GetXProperties.usersData.toString());
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
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CommonColors.blue,
        onPressed: () {
          Get.to(() => const FormMainPage());
        },
        child: Icon(
          CommonIcon.addUser.icon,
          size: 40,
        ),
      ),
    );
  }
}
