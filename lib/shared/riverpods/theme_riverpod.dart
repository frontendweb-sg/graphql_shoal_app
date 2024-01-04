import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// Theme provider
/// Later will need to change make it more verbose
/// now only updating true/false
///
final themeProvider = StateProvider<bool>((ref) => false);
