import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    addError(Exception("Couldn't Write to Storage!"), StackTrace.current);
    return state.toMap();
  }

  // @override
  // void onChange(Change<CounterState> change) {
  //   print("Current: " +
  //       change.currentState.counterValue.toString() +
  //       " next: " +
  //       change.nextState.counterValue.toString());
  //   print(change);
  //   super.onChange(change);
  // }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   print(error);
  //   print(stackTrace);

  //   super.onError(error, stackTrace);
  // }

  

}
