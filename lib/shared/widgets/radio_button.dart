import 'package:flutter/material.dart';

Widget radioButton (
  BuildContext context, {
  required void Function(Object?)? onChanged,
  required bool value,
  required String title,
  required String groupValue,
  }
) {
    return Row(
      children: [
      Expanded(  
      child: RadioListTile(
        contentPadding: const EdgeInsets.all(0.0),
        controlAffinity: ListTileControlAffinity.leading,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged      
        ),
        )]
    );
}
