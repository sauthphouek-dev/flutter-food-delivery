part of 'select_method_cubit.dart';

abstract class SelectMethodState extends Equatable {
  const SelectMethodState();
}

class SelectMethodInitial extends SelectMethodState {
  @override
  List<Object> get props => [];
}

class SelectMethodLoaded extends SelectMethodState {
  final PaymentMethod paymentMethod;

  const SelectMethodLoaded(this.paymentMethod);

  @override
  List<Object> get props => [paymentMethod];
}

class SelectMethodLoading extends SelectMethodState {
  @override
  List<Object> get props => [];
}

class SelectMethodError extends SelectMethodState {
  final String message;

  const SelectMethodError(this.message);

  @override
  List<Object> get props => [message];
}
