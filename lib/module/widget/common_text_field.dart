import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/getx_properties/getx_properties.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.label,
      required this.validator,
      required this.keyBoardType});
  final String? label;
  final String? Function(String?) validator;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
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

class CommonTextFieldWithIcon extends StatelessWidget {
  const CommonTextFieldWithIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.validator,
    required this.keyBoardType,
  });
  final Icon icon;
  final String label;
  final String? Function(String?) validator;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    TextEditingController date = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: date,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: CommonText(text: label),
          hintText: label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () async {
              DateTime? datePicker = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2025),
              );
              if (datePicker != null) {
                selectedDate = datePicker;
                date.text =
                    '${datePicker.day}/${datePicker.month}/${datePicker.year}';
              }
            },
            child: Icon(
              icon.icon,
              color: CommonColor.coffee,
            ),
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
      child: DropdownButtonFormField(
        value: GetXProperties.dropDownValue,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: CommonText(text: label),
          hintText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
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
    );
  }
}
