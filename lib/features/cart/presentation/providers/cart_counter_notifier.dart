import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_counter_notifier.g.dart';

@riverpod
class CartCounter extends _$CartCounter {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    if (state > 0) {
      state--;
    }
  }

  void reset() {
    state = 0;
  }

  void setCount(int count) {
    state = count >= 0 ? count : 0;
  }
}
