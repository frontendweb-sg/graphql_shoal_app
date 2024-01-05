import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/config/images.dart';
import 'package:graphql_shoal_app/shared/widgets/button.dart';
import 'package:graphql_shoal_app/shared/widgets/navbar.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';

///
/// Success creen
///
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 202,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImage.imgGirlGrop),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              textHedlineLarge(context, label: 'Success'),
              const SizedBox(
                height: 10,
              ),
              textBodySmall(context,
                  label: 'Your request has successfully sent!'),
              const SizedBox(
                height: 20,
              ),
              button(context, label: 'Continue', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
