import 'package:flutter/material.dart';
import 'package:flutter_project/layout/default_layout.dart';
import 'package:flutter_project/riverpod/code_generation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));
    final state5 = ref.watch(gStateNotifierProvider);

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(children: [
        Text('State1 : $state1'),
        state2.when(
          data: (data) {
            return Text(
              data.toString(),
              textAlign: TextAlign.center,
            );
          },
          error: (err, stack) => Text(
            err.toString(),
          ),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
        state3.when(
          data: (data) {
            return Text(
              data.toString(),
              textAlign: TextAlign.center,
            );
          },
          error: (err, stack) => Text(
            err.toString(),
          ),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
        Text('State4: $state4'),
        Text('State5 : $state5'),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(gStateNotifierProvider.notifier).increment();
              },
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(gStateNotifierProvider.notifier).decrement();
              },
              child: Text('Decrement'),
            ),
            // invalidate()
            // 유효하지 않게 하다
            ElevatedButton(
              onPressed: () {
                ref.invalidate(gStateNotifierProvider); // 상태가 어떻게 됬던 초기상태로 돌아온다. (초기화라고 생각하면됨 - 초깃값 ) 
              },
              child: Text('invalidate'),
            ),
          ],
        )
      ]),
    );
  }
}
