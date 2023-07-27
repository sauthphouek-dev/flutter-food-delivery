import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../gen/assets.gen.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState());

  Future<void> getPaymentMethods() async {
    emit(
      const PaymentState(
        status: PaymentStatus.loading,
      ),
    );
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(
        PaymentState(
          status: PaymentStatus.loaded,
          paymentMethods: PaymentMethod.paymentMethods,
        ),
      );
    } catch (e) {
      emit(
        PaymentState(
          status: PaymentStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
