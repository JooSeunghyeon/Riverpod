// TODO 어떤 provider 라던지 다 똑같이 사용이 가능하다.
// 이건 FutureProvider 로 예제로 들거다.

import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);

});