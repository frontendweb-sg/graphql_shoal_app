import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_shoal_app/config/images.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/features/home/presentation/widgets/panel.dart';
import 'package:graphql_shoal_app/features/loan/presentation/pages/loan_screen.dart';
import 'package:graphql_shoal_app/shared/widgets/horizontal_panel.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';

class HomeScreenContent extends ConsumerWidget {
  const HomeScreenContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            AppImage.imgHomeScreenBg,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(25.0, 285.0, 25.0, 25.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColor.kTransparent,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    panelCard(
                      context,
                      image: AppImage.imgUserDollarIcon,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) => const LoanScreen(),
                          ),
                        );
                      },
                      label: 'Personal loan',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    panelCard(
                      context,
                      image: AppImage.imgCreditCardIcon,
                      onPressed: () {},
                      label: 'Credit loan',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const HorizontalCard(),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 180,
                  child: Image.asset(
                    AppImage.imgAddScreenImg,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                textDisplayMedium(
                  context,
                  color: Colors.red,
                  label: 'Last visited: ${DateTime.now()}',
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
