import 'package:delivery_app/payment/cubit/select_method_cubit.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/custom_app_bar.dart';
import 'package:delivery_app/upload_photo/view/upload_photo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../shared/widgets/custom_loading.dart';
import '../payment.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  static const String routePath = '/payment';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentCubit(),
      child: const PaymentView(),
    );
  }
}

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late PaymentCubit _paymentCubit;

  @override
  void initState() {
    super.initState();
    _paymentCubit = context.read<PaymentCubit>();
    _fetchPaymentMethods();
  }

  void _fetchPaymentMethods() {
    _paymentCubit.getPaymentMethods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: 'Payment method'),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight -
                    MediaQuery.of(context).size.width * .1,
                maxHeight: constraint.maxHeight,
              ),
              child: BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  if (state.status == PaymentStatus.loading) {
                    return const Center(
                      child: CustomLoading(),
                    );
                  } else if (state.status == PaymentStatus.error) {
                    return Center(
                      child: Text(
                        state.message,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.grey400,
                            ),
                      ),
                    );
                  } else if (state.status == PaymentStatus.loaded) {
                    return IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: AppSpacing.lg),
                              Text(
                                'This data will be displayed in your account profile for security',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                    ),
                              ),
                              const SizedBox(height: AppSpacing.xxlg),
                              ...List.generate(state.paymentMethods.length,
                                  (index) {
                                final method = state.paymentMethods[index];
                                return _PaymentMethodCard(method: method);
                              }),
                            ],
                          ),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppSpacing.lg,
                                ),
                                // background gradient
                                backgroundColor: AppColors.primary90,
                              ),
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(UploadPhotoPage.routePath);
                              },
                              child: Text(
                                'Next',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: AppColors.white,
                                      fontWeight: AppFontWeight.semiBold,
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          ),

                          // elevated button at the bottom of the screen
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  const _PaymentMethodCard({
    required this.method,
  });

  final PaymentMethod method;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SelectMethodCubit, SelectMethodState, PaymentMethod?>(
      selector: (state) {
        if (state is SelectMethodLoading) {
          context.loaderOverlay.show();
        } else if (state is SelectMethodLoaded) {
          context.loaderOverlay.hide();
          return state.paymentMethod;
        }
        return null;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<SelectMethodCubit>().selectMethod(method);
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(AppSpacing.sm),
            margin: const EdgeInsets.only(bottom: AppSpacing.xlg),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSpacing.lg),
              // check if the method is selected
              border: state == method
                  ? Border.all(
                      color: AppColors.primary90,
                      width: 1.2,
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey200,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: method.image.image(
              width: 56,
              height: 56,
            ),
          ),
        );
      },
    );
  }
}
