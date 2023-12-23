import 'package:bytecrm_form/core/constant/common_colors.dart';
import 'package:bytecrm_form/core/constant/common_icons.dart';
import 'package:bytecrm_form/module/widget/common_text.dart';
import 'package:flutter/material.dart';

class CommonFormStepCheck extends StatelessWidget {
  const CommonFormStepCheck({
    super.key,
    required this.isFilled,
    required this.leftLine,
    required this.rightLine,
  });
  final bool isFilled;
  final bool leftLine;
  final bool rightLine;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leftLine)
          SizedBox(
            width: 41,
            child: Divider(
              thickness: 2,
              color: isFilled ? CommonColor.green : CommonColor.blue,
            ),
          ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: CommonColor.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            border: Border.all(
              width: 3,
              color: isFilled ? CommonColor.green : CommonColor.blue,
            ),
          ),
          child: Icon(
            CommonIcon.check.icon,
            size: 40,
            color: isFilled ? CommonColor.green : CommonColor.blue,
          ),
        ),
        if (rightLine)
          SizedBox(
            width: 41,
            child: Divider(
              thickness: 2,
              color: isFilled ? CommonColor.green : CommonColor.blue,
            ),
          ),
      ],
    );
  }
}

class CommonPageNumber extends StatelessWidget {
  const CommonPageNumber(
      {super.key,
      required this.isFilled,
      required this.leftLine,
      required this.rightLine,
      required this.pageNumber});
  final String pageNumber;
  final bool isFilled;
  final bool leftLine;
  final bool rightLine;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leftLine)
          SizedBox(
            width: 49,
            child: Divider(
              thickness: 2,
              color: isFilled ? CommonColor.green : CommonColor.blue,
            ),
          ),
        Container(
          height: 34,
          width: 34,
          decoration: const BoxDecoration(
            color: CommonColor.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Center(
            child: CommonText(
              text: pageNumber,
              color: CommonColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (rightLine)
          SizedBox(
            width: 49,
            child: Divider(
              thickness: 2,
              color: isFilled ? CommonColor.green : CommonColor.blue,
            ),
          ),
      ],
    );
  }
}
