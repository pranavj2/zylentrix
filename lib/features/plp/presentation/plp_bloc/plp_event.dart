part of 'plp_bloc.dart';

sealed class PlpEvent extends Equatable {
  const PlpEvent();
}

class InitialfetchEvent extends PlpEvent {
  const InitialfetchEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
