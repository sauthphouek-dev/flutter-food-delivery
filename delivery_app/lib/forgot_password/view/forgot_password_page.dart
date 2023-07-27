import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/custom_app_bar.dart';
import 'package:delivery_app/shared/widgets/elevated_button_action.dart';
import 'package:delivery_app/verify_otp/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

import '../forgot_password.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  static const String routePath = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(),
      child: const ForgotPasswordView(),
    );
  }
}

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Forgot password?',
      ),
      body: LayoutBuilder(
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
                    Column(
                      children: [
                        const SizedBox(height: AppSpacing.lg),
                        Text(
                          'Select which contact details should we use to reset your password',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                        ),
                        const SizedBox(height: AppSpacing.xxlg),
                        _SocialContainer(
                          title: '+6282******39',
                          icon: IconlyBold.chat,
                          onTap: () {
                            // open camera
                          },
                          socialName: 'via SMS:',
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        _SocialContainer(
                          title: 'ex***le@yourdomain.com',
                          icon: IconlyBold.message,
                          onTap: () {},
                          socialName: 'via Email:',
                        ),
                      ],
                    ),
                    ElevatedButtonAction(
                      title: 'Next',
                      onTap: () {
                        GoRouter.of(context).push(VerifyOtpPage.routePath);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SocialContainer extends StatelessWidget {
  const _SocialContainer({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.socialName,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final String socialName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.xlg),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            AppSpacing.lg,
          ),
          border: Border.all(
            color: AppColors.grey200,
            width: 1,
          ),
          // box shadow bottom
          boxShadow: [
            BoxShadow(
              color: AppColors.grey200,
              offset: const Offset(0, 2),
              blurRadius: 40,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.primary08,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 32,
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(socialName),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: AppFontWeight.semiBold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
