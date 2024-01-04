import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/config/images.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColor.kLightGreen,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(AppImage.imgApppLogo),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textDisplayMedium(context, label: 'Sharing is caring.'),
                Text(
                  "Share the same account upto 5 members by adding them into your family list.",
                  style: Theme.of(context).textTheme.copyWith().bodySmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
