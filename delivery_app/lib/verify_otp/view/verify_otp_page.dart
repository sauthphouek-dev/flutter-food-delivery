import 'package:delivery_app/reset_password/reset_password.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/custom_app_bar.dart';
import 'package:delivery_app/shared/widgets/elevated_button_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../gen/assets.gen.dart';
import '../verify_otp.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  static const String routePath = '/verify-otp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyOtpCubit(),
      child: const VerifyOtpView(),
    );
  }
}

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'Forgot password',
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight -
                      MediaQuery.of(context).size.width * .1,
                  maxHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.logo.image(
                            height: MediaQuery.of(context).size.width * .4,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            'Code has been send to +6282******39',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                          ),
                          const SizedBox(height: AppSpacing.xxlg),
                          // _OtpContainer(),
                          // custom otp container widget 4
                          // digit otp code
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                            ),
                            child: PinCodeTextField(
                              keyboardType: TextInputType.number,
                              animationType: AnimationType.fade,
                              animationCurve: Curves.linear,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              appContext: context,
                              textStyle: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderWidth: 1.5,
                                activeBorderWidth: 1.5,
                                inactiveBorderWidth: 1.5,
                                selectedBorderWidth: 1.5,
                                borderRadius:
                                    BorderRadius.circular(AppSpacing.lg),
                                fieldHeight: 68,
                                fieldWidth: 68,
                                inactiveFillColor: AppColors.white,
                                activeFillColor: AppColors.white,
                                activeColor: AppColors.primary50,
                                inactiveColor: AppColors.grey300,
                                selectedColor: AppColors.primary,
                                selectedFillColor: AppColors.grey50,
                              ),
                              length: 4,
                              onChanged: (value) {},
                              onCompleted: (value) {
                                GoRouter.of(context)
                                    .push(ResetPasswordPage.routePath);
                              },
                              cursorColor: AppColors.primary80,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xxlg),

                          // _ResendOtpButton(),
                          // resend otp button
                          // resend code in 00:59 s
                          Text(
                            'Resend code in 59 s',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButtonAction(
                        title: 'Next',
                        onTap: () {
                          GoRouter.of(context)
                              .push(ResetPasswordPage.routePath);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
