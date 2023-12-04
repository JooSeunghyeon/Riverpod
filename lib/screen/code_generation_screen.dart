import 'package:flutter/material.dart';
import 'package:flutter_project/layout/default_layout.dart';
import 'package:flutter_project/riverpod/code_generation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');

    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));

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
        Consumer( // TODO 중요! _StateFiveWidget 참고하기.
          builder: (context, ref, child) {
            print('builder build');
            final state5 = ref.watch(gStateNotifierProvider);

            return Row(
              children: [
                Text('State5 : $state5'),
                if(child != null) child, // 이건 딱 한번만 빌드만 된다. (변경 사항이 딱히 필요하지 않을때 자주 쓴다) - 일종의 const 라고 알고있음 된다.
              ],
            );
          },
          child: Text('hello'),
        ),
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
                ref.invalidate(
                    gStateNotifierProvider); // 상태가 어떻게 됬던 초기상태로 돌아온다. (초기화라고 생각하면됨 - 초깃값 )
              },
              child: Text('invalidate'),
            ),
          ],
        )
      ]),
    );
  }
}

// 따로 ref 를 하고 싶으면 원래라면 코드가 위에서 부터 실행되서 전체 빌드가 된다 그래서 이런식으로 만들어주는데 .
// 위 Consumer를 보면 그 안에서만 빌드를 실행할 수도 있다.
class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);

    return Text('State5 : $state5');
  }
}
