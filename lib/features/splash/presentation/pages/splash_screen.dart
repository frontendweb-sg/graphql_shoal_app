import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/config/constants.dart';
import 'package:graphql_shoal_app/config/contents.dart';
import 'package:graphql_shoal_app/config/images.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/config/theme/decorations.dart';
import 'package:graphql_shoal_app/features/auth/presentation/pages/login_screen.dart';
import 'package:graphql_shoal_app/features/auth/presentation/pages/register_screen.dart';
import 'package:graphql_shoal_app/gloabl.dart';
import 'package:graphql_shoal_app/shared/widgets/button.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  @override
  ConsumerState<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  void onSinup() {
    // Globals.storageService
    //     .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
    // navigate to signup screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (build) => const RegisterScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.bottomCenter,
        decoration: decoration(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: SafeArea(
            child: buildContent(),
          ),
        ),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: [
        Image.asset(
          AppImage.imgApppLogo,
        ),
        const SizedBox(
          height: 90,
        ),
        textHedlineMedium(
          context,
          align: TextAlign.center,
          color: AppColor.kBlack,
          label: AppContent.strSplashScreenText,
        ),
        const SizedBox(
          height: 90,
        ),
        const CircleAvatar(
          backgroundColor: AppColor.kPrimaryColor,
          foregroundColor: AppColor.kWhite,
          child: Icon(Icons.arrow_forward_ios),
        ),
        const SizedBox(
          height: 30,
        ),
        button(context, onPressed: onSinup, label: AppContent.strSignup),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textDisplayMedium(context, label: AppContent.strAlreadyHaveAccount),
            button(
              context,
              variant: Variant.text,
              onPressed: () {
                // Globals.storageService
                //     .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const LoginScreen(),
                  ),
                );
              },
              label: AppContent.strLoginText,
            )
          ],
        )
      ],
    );
  }
}
