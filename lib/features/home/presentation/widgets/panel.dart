import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/config/contents.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/shared/widgets/button.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';

Widget panelCard(
  BuildContext context, {
  required Function() onPressed,
  required String label,
  String? image,
  Icon? icon,
}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColor.kGrayLight,
        border: Border.all(
          color: AppColor.kBorderColor,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Image.asset(image!),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: textBodyLarge(
              context,
              label: label,
              color: AppColor.kDarkGreen,
            ),
          ),
          button(
            context,
            variant: Variant.outlined,
            height: 40,
            onPressed: onPressed,
            label: AppContent.strApplyNow,
            //child: const Text('Apply now'),
          ),
        ],
      ),
    ),
  );
}
