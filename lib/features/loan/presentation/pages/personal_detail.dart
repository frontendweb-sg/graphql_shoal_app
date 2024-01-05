import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoal_app/core/constants/colors.dart';
import 'package:shoal_app/core/utils/index.dart';
import 'package:shoal_app/features/shoal/presentation/widgets/common/button.dart';
import 'package:shoal_app/features/shoal/presentation/widgets/common/heading.dart';
import 'package:shoal_app/features/shoal/presentation/widgets/common/input.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() {
    return _PersonalDetailsState();
  }
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _personalDetailForm = GlobalKey<FormState>();
  final Map<String, dynamic> _form = {
    "name": "",
    "email": "",
    "mobile": "",
    "address": "",
    "state": "",
    "city": "",
    "pincode": ""
  };
  bool _checked = false;
  void onSumit() {
    if (_personalDetailForm.currentState!.validate()) {
      _personalDetailForm.currentState!.save();

      print(_form);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personalDetailForm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Heading(
              label: 'Personal Details',
              variant: Variant.large,
            ),
            const SizedBox(
              height: gapLg,
            ),
            Input(
              value: _form['name'],
              hintText: 'Name',
              onSaved: (value) {
                _form['name'] = value!;
              },
            ),
            Input(
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              value: _form['email'],
              hintText: 'Email',
              onSaved: (value) {
                _form['email'] = value!;
              },
            ),
            Input(
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
              value: _form['mobile'],
              hintText: 'Mobile',
              onSaved: (value) {
                _form['mobile'] = value!;
              },
            ),
            Input(
              icon: Icons.place,
              value: _form['address'],
              hintText: 'Address',
              onSaved: (value) {
                _form['address'] = value!;
              },
            ),
            Input(
              icon: Icons.room,
              value: _form['city'],
              hintText: 'City',
              onSaved: (value) {
                _form['city'] = value!;
              },
            ),
            Input(
              icon: Icons.phone,
              value: _form['pincode'],
              hintText: 'Pincode',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onSaved: (value) {
                _form['pincode'] = value!;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    value: _checked,
                    onChanged: (value) {
                      setState(() {
                        _checked = value!;
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
                              fontWeight: FontWeight.bold, color: gray),
                        ),
                        const WidgetSpan(
                            child: SizedBox(
                          width: 4,
                        )),
                        TextSpan(
                          text: 'Terms & Conditions \n',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: lightBlue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('t 7 c');
                            },
                        ),
                        const TextSpan(
                          text: 'and',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: gray),
                        ),
                        const WidgetSpan(
                            child: SizedBox(
                          width: 4,
                        )),
                        TextSpan(
                          text: 'Privacy policy',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: lightBlue),
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
              height: 15,
            ),
            Button(label: 'Save', width: double.infinity, onPressed: onSumit)
          ],
        ),
      ),
    );
  }
}
