import 'dart:io';

import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class GetXProperties extends GetxController {
  static RxInt currentPage = 0.obs;

  static final List<String> dropDownList = [
    'Admin',
    'Employee',
    'User',
    'Other'
  ];
  static List<String> monthsList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  static RxBool pageThreeIsDone = false.obs;
  static String? dropDownValue;
  static RxBool numberIsNotValid = false.obs;
  static RxBool birthDateIsNotValid = false.obs;
  static RxBool anniversaryDateIsNotValid = false.obs;
  static RxBool designationIsNotValid = false.obs;
  static RxBool roleIsNotValid = false.obs;
  static RxBool fullTime = true.obs;
  static RxDouble workingHours = 0.0.obs;
  static String? image;
  static RxString profileImage = ''.obs;

  static Future pickProfileImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = pickedImage.path.toString();
    }
    if (image != null) {
      CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: image.toString(),
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
          CropAspectRatioPreset.original
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(title: 'Crop Image')
        ],
      );
      if (croppedImage != null) {
        profileImage.value = croppedImage.path.toString();
      }
      image = '';
    }
  }
}
