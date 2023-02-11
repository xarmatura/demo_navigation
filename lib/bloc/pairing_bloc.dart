import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PairingEvent {}

class Increase extends PairingEvent {}
class Decrease extends PairingEvent {}

class PairingState {
  final int value;

  PairingState({required this.value});

  PairingState copyWith({int? value}) {
    return PairingState(
      value: value ?? this.value,
    );
  }
}

class PairingBloc extends Bloc<PairingEvent, PairingState> {
  PairingBloc() : super(PairingState(value: 1)) {
    on<Increase>((_, emit) => emit(state.copyWith(value: state.value + 1)));
    on<Decrease>((_, emit) => emit(state.copyWith(value: state.value - 1)));
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
