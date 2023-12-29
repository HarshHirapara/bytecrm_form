import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class GetXProperties extends GetxController {
  //user data list
  static RxList usersData = [].obs;

  //current page of form
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

  static String? image;

  static RxBool pageThreeIsDone = false.obs;
  static RxBool numberIsNotValid = false.obs;
  static RxBool birthDateIsNotValid = false.obs;
  static RxBool anniversaryDateIsNotValid = false.obs;
  static RxBool designationIsNotValid = false.obs;
  static RxBool roleIsNotValid = false.obs;
  static RxBool fullTime = true.obs;
  static RxBool insertDataOrUpdateData = true.obs;
  static RxDouble workingHourPerDay = 0.0.obs;
  static RxString totalHours = ''.obs;
  static RxString totalMinutes = ''.obs;
  static RxString profileImage = ''.obs;

  //form values
  static TextEditingController fullName = TextEditingController();
  static RxString userImage = ''.obs;
  static TextEditingController mobileNumber = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController birthDate = TextEditingController();
  static TextEditingController anniversaryDate = TextEditingController();
  static TextEditingController designation = TextEditingController();
  static String? dropDownRole;
  static String? dropDownReportTo;
  static TextEditingController joiningDate = TextEditingController();
  static TextEditingController employmentTime = TextEditingController();
  static RxString workingHours = ''.obs;

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
            toolbarTitle: CommonString.cropImage,
            toolbarColor: CommonColors.blue,
            toolbarWidgetColor: CommonColors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: CommonString.cropImage,
            aspectRatioLockDimensionSwapEnabled: true,
          )
        ],
      );
      if (croppedImage != null) {
        profileImage.value = croppedImage.path.toString();
        GetXProperties.userImage.value = GetXProperties.profileImage.toString();
      }
      image = null;
    }
  }

  static clearData() {
    GetXProperties.fullName.clear();
    GetXProperties.userImage.value = '';
    GetXProperties.mobileNumber.clear();
    GetXProperties.email.clear();
    GetXProperties.birthDate.clear();
    GetXProperties.anniversaryDate.clear();
    GetXProperties.designation.clear();
    GetXProperties.dropDownRole = null;
    GetXProperties.dropDownReportTo = null;
    GetXProperties.joiningDate.clear();
    GetXProperties.employmentTime.clear();
    GetXProperties.workingHours.value = '';
    GetXProperties.currentPage.value = 0;
    GetXProperties.fullTime.value = true;
    GetXProperties.profileImage.value = '';
    GetXProperties.workingHourPerDay.value = 0;
    GetXProperties.totalHours.value = '';
    GetXProperties.totalMinutes.value = '';
  }

  static Future workingHoursCalculation() async {
    totalHours.value = (workingHourPerDay.value ~/ 60) < 10
        ? '0${workingHourPerDay.value ~/ 60}:'
        : '${workingHourPerDay.value ~/ 60}:';

    totalMinutes.value = (workingHourPerDay.value % 60) < 10
        ? '0${(workingHourPerDay.value % 60).toInt()}'
        : '${(workingHourPerDay.value % 60).toInt()}';

    workingHours.value = totalHours.toString() + totalMinutes.toString();
  }
}
