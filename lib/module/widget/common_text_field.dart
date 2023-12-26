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
      this.maxLength});
  final String? label;
  final String? Function(String?) validator;
  final TextInputType keyBoardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
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
  });

  final String label;
  final String? Function(String?) validator;
  final TextInputType keyBoardType;
  final DateTime lastDate;

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    TextEditingController date = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onTap: () async {
          DateTime? datePicker = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: lastDate,
          );
          if (datePicker != null) {
            selectedDate = datePicker;
            date.text =
                '${datePicker.day} ${GetXProperties.monthsList[datePicker.month - 1]} ${datePicker.year}';
          }
        },
        controller: date,
        keyboardType: TextInputType.none,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: CommonText(text: label),
          hintText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          suffixIcon: Icon(
            CommonIcon.calender.icon,
            color: CommonColor.coffee,
          ),
        ),
        validator: validator,
      ),
    );
  }
}

class CommonDropDownButtonTextFiled extends StatelessWidget {
  const CommonDropDownButtonTextFiled(
      {super.key, required this.label, required this.validator});
  final String label;
  final String? Function(String?) validator;
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
          onChanged: (String? value) {
            GetXProperties.dropDownValue = value!;
          },
        ),
      ),
    );
  }
}
