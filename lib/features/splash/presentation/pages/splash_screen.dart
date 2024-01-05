import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/config/theme/decorations.dart';
import 'package:graphql_shoal_app/core/constants/contents.dart';
import 'package:graphql_shoal_app/core/constants/images.dart';
import 'package:graphql_shoal_app/features/auth/presentation/pages/login_screen.dart';
import 'package:graphql_shoal_app/features/auth/presentation/pages/register_screen.dart';
import 'package:graphql_shoal_app/features/splash/presentation/providers/index_notifier.dart';
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
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: decoration(),
        alignment: Alignment.bottomCenter,
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            ref.read(indexDotProvider.notifier).changeIndex(value);
          },
          children: [
            buildContent(
              index: 1,
              controller: _pageController,
              label: AppContent.strSplashScreenText,
              image: AppImage.imgSplashScreen1,
            ),
            buildContent(
              index: 2,
              controller: _pageController,
              label: AppContent.strSplashScreenText,
              image: AppImage.imgSplashScreen2,
            ),
            buildContent(
              index: 3,
              controller: _pageController,
              label: AppContent.strSplashScreenText,
              image: AppImage.imgAppLogo,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent({
    required int index,
    required String image,
    required String label,
    required PageController controller,
  }) {
    void onNext(Widget routePage) {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: const Duration(microseconds: 300),
          curve: Curves.linear,
        );
      } else {
        // Globals.storageService
        //     .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
        // navigate to signup screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (build) => routePage,
          ),
        );
      }
    }

    return Container(
      padding: const EdgeInsets.all(25.0),
      width: MediaQuery.of(context).size.width - 50.0,
      height: MediaQuery.of(context).size.height - 50.0,
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(image),
            const SizedBox(
              height: 90,
            ),
            textHedlineMedium(
              context,
              align: TextAlign.center,
              color: AppColor.kBlack,
              label: label,
            ),
            const SizedBox(
              height: 90,
            ),
            // const CircleAvatar(
            //   backgroundColor: AppColor.kPrimaryColor,
            //   foregroundColor: AppColor.kWhite,
            //   child: Icon(Icons.arrow_forward_ios),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: DotsIndicator(
                decorator: dotDecoration(),
                position: ref.watch(indexDotProvider),
                dotsCount: 3,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            button(context,
                onPressed: () => onNext(const RegisterScreen()),
                label: index == 3 ? AppContent.strSignup : AppContent.strNext),
            const SizedBox(
              height: 5,
            ),
            if (index == 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textDisplayMedium(context,
                      label: AppContent.strAlreadyHaveAccount),
                  button(
                    context,
                    variant: Variant.text,
                    onPressed: () => onNext(const LoginScreen()),
                    label: AppContent.strLoginText,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
