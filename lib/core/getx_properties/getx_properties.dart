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
  static RxDouble workingHourPerDay = 0.0.obs;
  static RxString totalHours = ''.obs;
  static RxString totalMinutes = ''.obs;
  static RxString profileImage = ''.obs;

  //form values
  static TextEditingController userImage = TextEditingController();
  static TextEditingController fullName = TextEditingController();
  static TextEditingController mobileNumber = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController birthDate = TextEditingController();
  static TextEditingController anniversaryDate = TextEditingController();
  static TextEditingController designation = TextEditingController();
  static String? dropDownRole;
  static String? dropDownReportTo;
  static TextEditingController joiningDate = TextEditingController();
  static TextEditingController employmentTime = TextEditingController();
  static TextEditingController workingHours = TextEditingController();

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
        GetXProperties.userImage.text =
            GetXProperties.profileImage.value.toString();
      }
      image = '';
    }
  }
}
