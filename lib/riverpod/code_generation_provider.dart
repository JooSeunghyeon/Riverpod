import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 Provider를 사용할지 결정할 고민 할 필요 없도록
// Provider, FutureProvider, StreamProvider(x)
// StateNotifierProvider

final _testProvider = Provider<String>((ref) => 'Hello Code Generation'); // 밑이랑 똑같은거 처음엔 이렇게 사용함

@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

@Riverpod(
  // 살려둬라
  // 이걸쓰면 autodispose 를 안함 살아있음. **중요
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

// 2) Parameter > Fmaily 파라미터를 일반 함수처럼 사용할 수 있도록
class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFamilyPRovider = Provider.family<int, Parameter>(
  (ref, Parameter) => Parameter.number1 * Parameter.number2,
); // 아래랑 같은거임

@riverpod
int gStateMultiply(GStateMultiplyRef ref,{
  required int number1,
  required int number2,
}){
  return number1 * number2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier{

  @override
  int build(){
    return 0;
  }

  increment(){
    state ++;
  }

  decrement(){
    state --;
  }
}
