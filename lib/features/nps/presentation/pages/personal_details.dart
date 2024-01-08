import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/config/theme/decorations.dart';
import 'package:graphql_shoal_app/core/constants/contents.dart';
import 'package:graphql_shoal_app/core/constants/images.dart';
import 'package:graphql_shoal_app/shared/widgets/button.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';

class NPSPersonalDetailsScreen extends StatefulWidget {
  const NPSPersonalDetailsScreen({super.key});

  @override
  State<NPSPersonalDetailsScreen> createState() {
    return _NPSPersonalDetailsScreenState();
  }
}

class _NPSPersonalDetailsScreenState extends State<NPSPersonalDetailsScreen> {
  String typeVlaue = "Public";
  String gender = "male";  
  final _formKey = GlobalKey<FormState>();
  bool _privacyPolicy = false;
  final Map<String, dynamic> _form = {
    "type": "",
    "name": "",
    "email": "",
    "mobile": "",
    "address": "",
    "state": "",
    "city": "",
    "pincode": ""
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
          label: AppContent.strPersonalDetails,
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
                children: [
                  Expanded(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      title: const Text("Public"),
                      value: "Public",
                      groupValue: typeVlaue,
                      onChanged: (value) {
                        setState(() {
                           typeVlaue = value!; 
                        });
                      },
                      )
                    ),
                    Expanded(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      title: const Text("Private"),
                      value: "Private",
                      groupValue: typeVlaue,
                      onChanged: (value) {
                        setState(() {
                           typeVlaue = value!; 
                        });
                      },
                      )
                    )
                ],
              ), 
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: inputDecoration(
                  context,
                  hintText: 'Name',
                  imageIcon: AppImage.imgName,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: inputDecoration(
                  context,
                  hintText: 'Email',
                  imageIcon: AppImage.imgMail,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: inputDecoration(
                  context,
                  hintText: 'Number',
                  imageIcon: AppImage.imgMobile,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: inputDecoration(
                  context,
                  hintText: 'Address',
                  imageIcon: AppImage.imgLocator,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: inputDecoration(
                  context,
                  hintText: 'State',
                  imageIcon: AppImage.imgLocator,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: inputDecoration(
                  context,
                  hintText: 'City',
                  imageIcon: AppImage.imgLocator,
                ),
              ),        
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: inputDecoration(
                  context,
                  hintText: 'Pincode',
                  imageIcon: AppImage.imgLocator,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),

              textTitleLarge(
                  context,
                  label: AppContent.strParentalDetails,
                  align: TextAlign.center,
                  color: AppColor.kBlack,
                ),
                const SizedBox(
                  height: 25.0,
                ),
             
              TextFormField(
                decoration: inputDecoration(
                  context,
                  hintText: 'Father’s Name',
                  imageIcon: AppImage.imgName,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: inputDecoration(
                  context,
                  hintText: 'Mother’s Name',
                  imageIcon: AppImage.imgName,
                ),
              ),

              const SizedBox(
                height: 15.0,
              ),
              
              const Text("Gender", textAlign: TextAlign.start),
               Row(
                children: [                  
                  Expanded(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      
                      title: const Text("Male"),
                      value: "Male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                           gender = value!; 
                        });
                      },
                      )
                    ),
                    Expanded(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      title: const Text("Female"),
                      value: "Female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                           gender = value!; 
                        });
                      },
                      )
                    ),
                    Expanded(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0.0),                    
                      title: const Text("Other"),
                      value: "Other",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                           gender = value!; 
                        });
                      },
                      )
                    )
                ],
              ), 

              const SizedBox(
                height: 25.0,
              ),    
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: _privacyPolicy,
                      onChanged: (value) {
                        setState(() {
                          _privacyPolicy = value!;
                        });
                      }),
                  Expanded(
                    child: RichText(
                      softWrap: true,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Aggree to our',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.kGray),
                          ),
                          const WidgetSpan(
                              child: SizedBox(
                            width: 4,
                          )),
                          TextSpan(
                            text: 'Terms & Conditions \n',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.kPrimaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('t 7 c');
                              },
                          ),
                          const TextSpan(
                            text: 'and',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.kGray),
                          ),
                          const WidgetSpan(
                              child: SizedBox(
                            width: 4,
                          )),
                          TextSpan(
                            text: 'Privacy policy',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.kPrimaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('p 7 c');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45.0,
              ),
              button(context, onPressed: onSumit, label: "Submit"),
              const SizedBox(
                height: 15.0,
              ),
              textDisplayMedium(
                context,
                color: Colors.red,
                label: 'Last visited: ${DateTime.now()}',
              )
            ],
          ),
        ),
      ],
    );
  }
}
