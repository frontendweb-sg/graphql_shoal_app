import 'package:riverpod_annotation/riverpod_annotation.dart';
//final counterProvider = StateProvider<int>((ref) => 0);

part 'index_notifier.g.dart';

@riverpod
class IndexDot extends _$IndexDot {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int value) {
    state = value;
  }
}
