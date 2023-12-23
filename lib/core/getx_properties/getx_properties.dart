import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class GetXProperties {
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
}
