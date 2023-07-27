part of 'payment_cubit.dart';

enum PaymentStatus { initial, loading, loaded, error }

class PaymentMethod {
  final String name;
  final AssetGenImage image;
  final String description;
  final String id;

  PaymentMethod({
    required this.name,
    required this.image,
    required this.description,
    required this.id,
  });

  // payment method list with 3 items, paypal, visa, payoneer
  static List<PaymentMethod> get paymentMethods => [
        PaymentMethod(
          name: 'Paypal',
          image: Assets.icons.paypal,
          description: 'Paypal payment method',
          id: '1',
        ),
        PaymentMethod(
          name: 'Visa',
          image: Assets.icons.visa,
          description: 'Visa payment method',
          id: '2',
        ),
        PaymentMethod(
          name: 'Payoneer',
          image: Assets.icons.payoneer,
          description: 'Payoneer payment method',
          id: '3',
        ),
      ];
}

class PaymentState extends Equatable {
  const PaymentState({
    this.status = PaymentStatus.initial,
    this.message = '',
    this.paymentMethods = const <PaymentMethod>[],
  });

  final PaymentStatus status;
  final String message;
  final List<PaymentMethod> paymentMethods;

  PaymentState copyWith({
    PaymentStatus? status,
    String? message,
    List<PaymentMethod>? paymentMethods,
  }) {
    return PaymentState(
      status: status ?? this.status,
      message: message ?? this.message,
      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }

  @override
  List<Object?> get props => [status, message, paymentMethods];
}
