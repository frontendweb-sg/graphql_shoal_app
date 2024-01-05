import 'package:flutter/material.dart';
import 'package:shoal_app/core/utils/index.dart';
import 'package:shoal_app/features/shoal/data/models/checkbox.dart';
import 'package:shoal_app/features/shoal/presentation/widgets/common/body_text.dart';
import 'package:shoal_app/features/shoal/presentation/widgets/common/button.dart';
import 'package:shoal_app/features/shoal/presentation/widgets/common/container.dart';
import 'package:shoal_app/features/shoal/presentation/widgets/common/heading.dart';
import 'package:shoal_app/features/shoal/presentation/widgets/common/upload.dart';

class UploadDocument extends StatefulWidget {
  const UploadDocument({super.key});
  @override
  State<StatefulWidget> createState() {
    return _UploadDocumentState();
  }
}

class _UploadDocumentState extends State<UploadDocument> {
  final List<CheckBoxState> _educationList = [
    CheckBoxState(title: 'High school or below'),
    CheckBoxState(title: 'Undergraduate'),
    CheckBoxState(title: 'Masters Degree'),
    CheckBoxState(title: 'PhD'),
  ];
  final List<CheckBoxState> _identityList = [
    CheckBoxState(title: 'National Identity Card'),
    CheckBoxState(title: 'Driver\'s Licence'),
    CheckBoxState(title: 'International Passport'),
    CheckBoxState(title: 'Student ID'),
  ];
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Heading(
            label: 'Upload Document',
            variant: Variant.large,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Heading(
                      label: 'Education level',
                      variant: Variant.medium,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: _educationList
                          .map(buildEducationCheckboxList)
                          .toList(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  children: [
                    const Heading(
                      label: 'Form of identification',
                      variant: Variant.medium,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: _identityList
                          .map(buildEducationCheckboxList)
                          .toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Heading(
              label: 'Upload Form of identification', variant: Variant.medium),
          const SizedBox(
            height: 15.0,
          ),
          const Upload(),
          const SizedBox(
            height: 15.0,
          ),
          Button(label: 'Upload', onPressed: () {}),
        ],
      ),
    );
  }

  Widget buildEducationCheckboxList(CheckBoxState checkbox) {
    return CheckboxListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      title: BodyText(
        label: checkbox.title,
        variant: Variant.small,
      ),
      contentPadding: const EdgeInsets.all(0.0),
      value: checkbox.value,
      onChanged: (v) {
        setState(() {
          checkbox.value = v!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
