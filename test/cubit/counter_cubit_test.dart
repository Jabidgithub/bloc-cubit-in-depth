// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_cubit_02/logic/cubit/counter_cubit.dart';
// import 'package:flutter_bloc_cubit_02/logic/cubit/internet_cubit.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('CounterCubit', () {
//     late CounterCubit counterCubit;
//     setUp(() {
//       counterCubit = CounterCubit(internetCubit: BlocProvider.of<InternetCubit>());
//     });

//     tearDown(() {
//       counterCubit.close();
//     });

//     test('the initial state for CounterCubit is CounterState(counterrvalue:0)',
//         () {
//       expect(counterCubit.state, CounterState(counterValue: 0));
//     });

//     blocTest(
//       'the cubit should emit a CounterState(counterValue: 1, wasIncremented:true) when cubit.increment() Function is called',
//       build: () => counterCubit,
//       act: (cubit) => cubit.increment(),
//       expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
//     );

//     blocTest(
//       'the cubit should emit a CounterState(counterValue: -1, wasIncremented:true) when cubit.increment() Function is called',
//       build: () => counterCubit,
//       act: (cubit) => cubit.decrement(),
//       expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
//     );
//   });
// }
