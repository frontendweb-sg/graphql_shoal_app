import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_shoal_app/core/constants/contents.dart';
import 'package:graphql_shoal_app/features/account/presentation/pages/setting_screen.dart';
import 'package:graphql_shoal_app/features/history/presentation/pages/history_screen.dart';
import 'package:graphql_shoal_app/features/home/presentation/providers/tab.dart';
import 'package:graphql_shoal_app/features/home/presentation/widgets/home_content.dart';
import 'package:graphql_shoal_app/features/loan/presentation/pages/loan_screen.dart';
import 'package:graphql_shoal_app/features/nps/presentation/pages/other_details.dart';
import 'package:graphql_shoal_app/features/nps/presentation/pages/personal_details.dart';
import 'package:graphql_shoal_app/features/nps/presentation/pages/prof_of_Identity.dart';
import 'package:graphql_shoal_app/features/nps/presentation/pages/prof_of_address.dart';
import 'package:graphql_shoal_app/features/wallet/presentation/pages/wallet_screen.dart';
import 'package:graphql_shoal_app/shared/widgets/bottom_tab.dart';
import 'package:graphql_shoal_app/shared/widgets/navbar.dart';
import 'package:graphql_shoal_app/shared/widgets/sidebar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final currentTabIndex = ref.watch(tabProvider);

    Widget screen = const HomeScreenContent();

    if (currentTabIndex == 1) screen = const HistoryScreen();
    if (currentTabIndex == 2) screen = const WalletScreen();
    if (currentTabIndex == 3) screen = const AccountScreen();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const Navbar(
        title: AppContent.strHomeText,
      ),
      drawer: const Sidebar(),
      body: screen,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
