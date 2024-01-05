import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_shoal_app/config/images.dart';
import 'package:graphql_shoal_app/config/theme/colors.dart';
import 'package:graphql_shoal_app/shared/riverpods/theme_riverpod.dart';
import 'package:graphql_shoal_app/utils/sidebar/menu.dart';

class Sidebar extends ConsumerWidget {
  const Sidebar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          userHeader(context),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: sidebarMenu(context),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Logout",
            ),
          ),
          Text(
            'Last visited ${DateTime.now()}',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.red),
          ),
          Switch(
            value: themeState,
            onChanged: (value) {
              themeNotifier.state = value;
            },
          )
        ],
      ),
    );
  }
}

UserAccountsDrawerHeader userHeader(BuildContext context) {
  return UserAccountsDrawerHeader(
    accountName: Text(
      "Pradeep Kumar",
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: AppColor.kWhite),
    ),
    accountEmail: const Text("pradeep.kumar5@rsystems.com"),
    currentAccountPicture: ClipOval(
      child: Image.asset(
        AppImage.imgAvatarImg,
        fit: BoxFit.cover,
      ),
    ),
    decoration: const BoxDecoration(
      color: AppColor.kPrimaryColor,
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          AppImage.imgHomeScreenBg,
        ),
      ),
    ),
  );
}

Widget sidebarMenu(BuildContext context) => SingleChildScrollView(
      child: Column(
        children: sidebarMenus
            .map(
              (menu) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    menu.title.toString(),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.kTextGray,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ...ListTile.divideTiles(
                    color: AppColor.kBorderColor,
                    context: context,
                    tiles: menu.childrens!
                        .map(
                          (e) => ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            onTap: () => e.onPressed!(context),
                            dense: true,
                            leading: e.icon,
                            title: Text(
                              e.title.toString(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );