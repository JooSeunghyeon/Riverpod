import 'package:flutter_project/model/shopping_item_model.dart';
import 'package:flutter_project/riverpod/state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) { // all 전체를 반환
      return shoppingListState;
    }

    return shoppingListState // ex) isSpicy - 조건에 따른 반환
        .where((element) => filterState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
  },
);

enum FilterState {
  // 안매움
  notSpicy,
  // 매움
  spicy,
  // 전부
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
