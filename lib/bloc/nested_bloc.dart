import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NestedEvent {}
class Increase extends NestedEvent {}

class NestedState {
  final int value;

  NestedState({required this.value});

  NestedState copyWith({int? value}) {
    return NestedState(
      value: value ?? this.value,
    );
  }
}

class NestedBloc extends Bloc<NestedEvent, NestedState> {
  NestedBloc() : super(NestedState(value: 1)) {
    debugPrint("instantiate");
    on<Increase>((_, emit) => emit(state.copyWith(value: state.value + 1)));
  }

  increase() {
    add(Increase());
  }

  @override
  Future<void> close() {
    debugPrint("disposed");
    return super.close();
  }
}