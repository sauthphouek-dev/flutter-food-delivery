import 'package:delivery_app/payment/cubit/select_method_cubit.dart';
import 'package:delivery_app/payment/payment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentProviders {
  static List<BlocProvider> providers = [
    BlocProvider<PaymentCubit>(
      create: (context) => PaymentCubit(),
    ),
    BlocProvider<SelectMethodCubit>(
      create: (context) => SelectMethodCubit(),
    ),
  ];
}
