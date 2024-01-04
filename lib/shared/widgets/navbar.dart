import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/config/contents.dart';
import 'package:graphql_shoal_app/config/images.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/shared/widgets/typography.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        iconSize: 18.0,
        icon: const ImageIcon(
          AssetImage(
            AppImage.imgDrawerIcon,
          ),
          size: 18.0,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: textBodyLarge(
        context,
        color: AppColor.kBlack,
        label: AppContent.strHomeText,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage(
              AppImage.imgNotificationIcon,
            ),
            size: 17.5,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
