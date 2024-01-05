import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/core/constants/contents.dart';
import 'package:graphql_shoal_app/core/constants/images.dart';
import 'package:graphql_shoal_app/features/home/presentation/widgets/panel.dart';
import 'package:graphql_shoal_app/features/loan/presentation/pages/loan_screen.dart';
import 'package:graphql_shoal_app/shared/widgets/horizontal_panel.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';

class HomeScreenContent extends ConsumerWidget {
  const HomeScreenContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            isAntiAlias: true,
            AppImage.imgHomeScreenBg,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(25.0, 205.0, 25.0, 25.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
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
                label: AppContent.strApplyLoan,
              ),
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
                label: AppContent.strApplyNPS,
              ),
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
                label: AppContent.strRequest,
              ),
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
                label: AppContent.strContact,
              )
            ],
          ),
        ),
        Positioned(
          bottom: 25.0,
          child: textDisplayMedium(
            context,
            color: Colors.red,
            label: 'Last visited: ${DateTime.now()}',
          ),
        )
      ],
    );
  }
}
