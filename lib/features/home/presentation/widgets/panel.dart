import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/core/constants/contents.dart';
import 'package:graphql_shoal_app/shared/widgets/button.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';

Widget panelCard(
  BuildContext context, {
  required Function() onPressed,
  required String label,
  String? image,
  Icon? icon,
}) {
  return Ink(
    decoration: BoxDecoration(
      color: AppColor.kTransparent,
      border: Border.all(
        color: AppColor.kCardBorderColor,
        style: BorderStyle.solid,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      highlightColor: AppColor.kCardHighlightColor,
      onTap: () {
        print("HI");
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
          ],
        ),
      ),
    ),
  );
}
