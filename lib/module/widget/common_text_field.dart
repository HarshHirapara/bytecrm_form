import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_icons.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.label,
      required this.validator,
      required this.keyBoardType,
      this.maxLength,
      required this.controller});
  final String? label;
  final String? Function(String?) validator;
  final TextInputType keyBoardType;
  final int? maxLength;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: CommonText(text: label ?? ''),
          hintText: label ?? '',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        validator: validator,
      ),
    );
  }
}

class CommonTextFieldForDate extends StatelessWidget {
  const CommonTextFieldForDate({
    super.key,
    required this.label,
    required this.validator,
    required this.keyBoardType,
    required this.lastDate,
    required this.controller,
  });

  final String label;
  final String? Function(String?) validator;
  final TextInputType keyBoardType;
  final DateTime lastDate;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.none,
        validator: validator,
        onTap: () async {
          DateTime? datePicker = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: lastDate,
          );
          if (datePicker != null) {
            selectedDate = datePicker;
            controller.text =
                '${datePicker.day} ${GetXProperties.monthsList[datePicker.month - 1]} ${datePicker.year}';
          }
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: CommonText(text: label),
          hintText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          suffixIcon: Icon(
            CommonIcon.calender.icon,
            color: CommonColors.coffee,
          ),
        ),
      ),
    );
  }
}

class CommonDropDownButtonTextFiled extends StatelessWidget {
  const CommonDropDownButtonTextFiled({
    super.key,
    required this.label,
    required this.validator,
    required this.onChanged,
  });
  final String label;
  final String? Function(String?) validator;
  final void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          validator: validator,
          value: GetXProperties.dropDownValue,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: CommonText(text: label),
            hintText: label,
            border: const OutlineInputBorder(),
            contentPadding:
                const EdgeInsets.only(left: 12, top: 18, bottom: 18),
          ),
          items: GetXProperties.dropDownList.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
