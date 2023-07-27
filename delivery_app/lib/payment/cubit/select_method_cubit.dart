import 'package:bloc/bloc.dart';
import 'package:delivery_app/payment/cubit/payment_cubit.dart';
import 'package:equatable/equatable.dart';

part 'select_method_state.dart';

class SelectMethodCubit extends Cubit<SelectMethodState> {
  SelectMethodCubit() : super(SelectMethodInitial());

  Future<void> selectMethod(PaymentMethod paymentMethod) async {
    emit(SelectMethodLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(SelectMethodLoaded(paymentMethod));
    } catch (e) {
      emit(SelectMethodError(e.toString()));
    }
  }
}
