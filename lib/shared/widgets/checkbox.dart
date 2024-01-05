import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

Widget checkBox(
  BuildContext context, {
  required String title,
  required bool? value,
  required void Function(bool?)? onChanged,
  }) {
       return CheckboxListTile(
        activeColor: AppColor.kPrimaryColor,
        checkColor: AppColor.kWhite,
        title: Text(title),   
        value: value,
        onChanged: onChanged,
        );
  }