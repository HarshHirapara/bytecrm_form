import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:flutter/material.dart';

class CommonUserDetailsRichText extends StatelessWidget {
  const CommonUserDetailsRichText(
      {super.key, required this.hadingTitle, required this.titleData});
  final String hadingTitle;
  final String titleData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: hadingTitle,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          CommonText(
            text: titleData,
            fontSize: 15,
          )
        ],
      ),
    );
  }
}
