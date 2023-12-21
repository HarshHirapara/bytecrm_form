import 'package:get/state_manager.dart';

class GetXProperties {
  static RxInt currentPage = 0.obs;

  static final List<String> dropDownList = [
    'Admin',
    'Employee',
    'User',
    'Other'
  ];
  static String? dropDownValue;
  static RxBool numberIsNotValid = false.obs;
  static RxBool birthDateIsNotValid = false.obs;
  static RxBool anniversaryDateIsNotValid = false.obs;
  static RxBool designationIsNotValid = false.obs;
  static RxBool roleIsNotValid = false.obs;
}
