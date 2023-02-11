import 'package:flutter_bloc/flutter_bloc.dart';

abstract class InternalEvent {}

class Increase extends InternalEvent {}
class Decrease extends InternalEvent {}

class InternalState {
  final int value;

  InternalState({required this.value});

  InternalState copyWith({int? value}) {
    return InternalState(
      value: value ?? this.value,
    );
  }
}

class InternalBloc extends Bloc<InternalEvent, InternalState> {
  InternalBloc() : super(InternalState(value: 1)) {
    on<Increase>((_, emit) => emit(state.copyWith(value: state.value + 1)));
    on<Decrease>((_, emit) => emit(state.copyWith(value: state.value - 1)));
  }

  increase() {
    add(Increase());
  }
}
