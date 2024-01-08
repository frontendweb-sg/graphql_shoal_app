import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/core/constants/contents.dart';
import 'package:graphql_shoal_app/shared/model/checkbox.dart';
import 'package:graphql_shoal_app/shared/widgets/button.dart';
import 'package:graphql_shoal_app/shared/widgets/checkbox.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';
import 'package:graphql_shoal_app/shared/widgets/upload.dart';

class NPSProfOfAddressScreen extends StatefulWidget {
  const NPSProfOfAddressScreen({super.key});

  @override
  State<NPSProfOfAddressScreen> createState() {
    return _NPSProfOfAddressScreenScreenState();
  }
}

class _NPSProfOfAddressScreenScreenState extends State<NPSProfOfAddressScreen> {
  bool sameParmanentAddress = false;

  final List<CheckBoxState> correspondenceAddress = [
    CheckBoxState(title: 'National Identity Card'),
    CheckBoxState(title: 'Driver\'s Licence'),
    CheckBoxState(title: 'International Passport'),
    CheckBoxState(title: 'Adhar card'),
  ];

  final List<CheckBoxState> permanentAddress = [
    CheckBoxState(title: 'National Identity Card'),
    CheckBoxState(title: 'Driver\'s Licence'),
    CheckBoxState(title: 'International Passport'),
    CheckBoxState(title: 'Adhar card'),
  ];

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _form = {

  };

  void onSumit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print(_form);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(child: buildForm(context)),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Column(
      children: [
        textTitleLarge(
          context,
          label: AppContent.strProfOfAddress,
          align: TextAlign.center,
          color: AppColor.kBlack,
        ),
        const SizedBox(
          height: 50.0,
        ),
        Form(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: textTitleLarge(
                          context,
                          label: AppContent.strCorrespondenceAddress,
                          color: AppColor.kBlack
                          ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Flex(
                        direction: Axis.vertical,
                        children: correspondenceAddress
                            .map(buildEducationCheckboxList)
                            .toList(),
                      )
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 20.0,
              ),
              textTitleLarge(
                context,
                label: 'Upload ${AppContent.strCorrespondenceAddress}',
                color: AppColor.kBlack
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Upload(),
              const SizedBox(
                height: 15.0,
              ),            

              const SizedBox(height: 25.0),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.all(0.0),
                title: const Text("Please check in the box in case the address is same as above"),
                value: false,
                onChanged:(value){
                  setState(() {
                    sameParmanentAddress = value!;
                  });
                } 
                ),

               const SizedBox(height: 25.0), 
               Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: textTitleLarge(
                          context,
                          label: AppContent.strPermanentAddress,
                          color: AppColor.kBlack
                          ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Flex(
                        direction: Axis.vertical,
                        children: permanentAddress
                            .map(buildEducationCheckboxList)
                            .toList(),
                      )
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 20.0,
              ),
              textTitleLarge(
                context,
                label: 'Upload ${AppContent.strPermanentAddress}',
                color: AppColor.kBlack
                ),
              const SizedBox(
                height: 15.0,
              ),
              const Upload(),
              const SizedBox(
                height: 40.0,
              ),
              button(context, label: 'Submit', onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildEducationCheckboxList(CheckBoxState checkbox) {
    return checkBox(
      context,
      title: checkbox.title,
      value: checkbox.value,
      onChanged: (v) {
        setState(() {
          checkbox.value = v!;
        });
      },
    );
  }
}
