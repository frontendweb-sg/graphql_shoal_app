import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabNotifier extends StateNotifier<int> {
  TabNotifier() : super(0);

  void onTabChange(int index) {
    state = index;
  }
}

final tabProvider =
    StateNotifierProvider<TabNotifier, int>((ref) => TabNotifier());
