import 'package:flutter/material.dart';
import 'package:flutter_project/layout/default_layout.dart';
import 'package:flutter_project/riverpod/select_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    // 이 특정값은 쓰도록 해서 다른곳은 에러가 난다 왜냐 타입이 맞지않아서 . 아무리 다른걸 하더라도 빌드가 되지않는다.

    ref.listen(
      selectProvider.select((value) => value.hasBought),
      (previous, next) {
        print('next: $next');
      },
    );

    return DefaultLayout(
        title: 'SelectProviderScreen',
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.toString()),
              // Text(state.name),
              // Text(state.isSpicy.toString()),
              // Text(state.hasBought.toString()),
              ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleIsSpicy();
                },
                child: Text('Spicy Toggle'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleHasBought();
                },
                child: Text('HasBought Toggle'),
              ),
            ],
          ),
        ));
  }
}
