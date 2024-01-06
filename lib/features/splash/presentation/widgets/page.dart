import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';

Widget onBoardScreen(BuildContext context, {String? image, String? label}) {
  return SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(image!),
        const SizedBox(
          height: 90,
        ),
        textHedlineMedium(
          context,
          align: TextAlign.center,
          color: AppColor.kBlack,
          label: label!,
        ),
        const SizedBox(
          height: 90,
        ),
      ],
    ),
  );
}
