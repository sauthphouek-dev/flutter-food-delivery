import 'package:delivery_app/congrats/congrats.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/custom_app_bar.dart';
import 'package:delivery_app/shared/widgets/elevated_button_action.dart';
import 'package:delivery_app/shared/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../reset_password.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  static const String routePath = '/reset-password';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(),
      child: const ResetPasswordView(),
    );
  }
}

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late TextEditingController _password;
  late TextEditingController _confirmPassword;
  bool _isVisible1 = false;
  bool _isVisible2 = false;

  @override
  void initState() {
    super.initState();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Reset password',
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight -
                    MediaQuery.of(context).size.width * .1,
                maxHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          'Create a new password',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                        ),
                        const SizedBox(height: AppSpacing.xxxlg),
                        buildAlignLabel(context, "New Password"),
                        const SizedBox(height: AppSpacing.xxs),
                        // Password input with show/hide password
                        InputTextFormField(
                          controller: _password,
                          hintText: "Enter your password",
                          obscureText: true,
                          toggle: () {
                            setState(() {
                              _isVisible1 = !_isVisible1;
                            });
                          },
                          isVisible: _isVisible1,
                        ),
                        const SizedBox(height: AppSpacing.xlg),
                        buildAlignLabel(context, "Confirm New Password"),
                        const SizedBox(height: AppSpacing.xxs),
                        // Password input with show/hide password
                        InputTextFormField(
                          controller: _confirmPassword,
                          hintText: "Enter your password",
                          obscureText: true,
                          toggle: () {
                            setState(() {
                              _isVisible2 = !_isVisible2;
                            });
                          },
                          isVisible: _isVisible2,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                    ElevatedButtonAction(
                      onTap: () {
                        GoRouter.of(context).push(CongratsPage.routePath);
                      },
                      title: 'Save',
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

  Align buildAlignLabel(BuildContext context, String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.md),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
