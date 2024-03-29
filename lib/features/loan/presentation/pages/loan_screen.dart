import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/features/loan/presentation/pages/personal_detail.dart';
import 'package:graphql_shoal_app/shared/widgets/navbar.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() {
    return _LoanScreenState();
  }
}

class _LoanScreenState extends State<LoanScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      body: SafeArea(
        child: PersonalDetailsScreen(),
      ),
    );
  }
}
