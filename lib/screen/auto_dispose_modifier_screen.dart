import 'package:flutter/material.dart';
import 'package:flutter_project/layout/default_layout.dart';
import 'package:flutter_project/riverpod/auto_dispose_modifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoDisoposeModifierScreen extends ConsumerWidget {
  const AutoDisoposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);

    return DefaultLayout(
        title: 'AutoDisoposeModifierScreen',
        body: Center(
          child: state.when(
            data: (data) => Text(
              data.toString(),
            ),
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => CircularProgressIndicator(),
          ),
        ));
  }
}
