import 'package:delivery_app/bio/bio.dart';
import 'package:delivery_app/gen/assets.gen.dart';
import 'package:delivery_app/login/login.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../forgot_password/view/view.dart';
import '../sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const String routePath = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;

  // close keyboard
  void closeKeyboard() {
    if (isKeyboardOpen) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: Scaffold(
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  // flex 2 /3 image logo
                  Assets.images.logo.image(
                    height: MediaQuery.of(context).size.width * .4,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // Sign in to your account
                  Text(
                    "Sign up for free",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.xlg),
                  // flex 1/3 form
                  _SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm();

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  late TextEditingController _emailOrPhoneController;

  late TextEditingController _passwordController;
  bool _isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailOrPhoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Email label
        // Email label
        buildAlignLabel(context, "Email"),
        const SizedBox(height: AppSpacing.xxs),
        // Email input
        InputTextFormField(
          controller: _emailOrPhoneController,
          hintText: "Enter your email or phone number",
        ),

        const SizedBox(height: AppSpacing.lg),
        // Password label
        buildAlignLabel(context, "Password"),
        const SizedBox(height: AppSpacing.xxs),
        // Password input with show/hide password
        InputTextFormField(
          controller: _passwordController,
          hintText: "Enter your password",
          obscureText: true,
          toggle: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          isVisible: _isVisible,
        ),

        const SizedBox(height: AppSpacing.xxlg),
// Sign in button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            // background color primary60
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary40,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .016,
              ),
            ),
            onPressed: () {
              GoRouter.of(context).push(BioPage.routePath);
            },
            child: Text(
              "Sign up",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.white,
                    fontWeight: AppFontWeight.semiBold,
                    fontSize: 16,
                  ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        // Forgot password
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(ForgotPasswordPage.routePath);
          },
          style: TextButton.styleFrom(
            // splash color primary 90
            splashFactory: InkRipple.splashFactory,
          ),
          child: Text(
            "Forgot password?",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.primary90,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        // or continue with
        Text(
          "or continue with",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.lg),
        // Row with facebook and google icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // container
            buildSocialContainer(
              context,
              () {},
              Assets.icons.facebook,
              'Facebook',
            ),
            const SizedBox(width: AppSpacing.md),
            buildSocialContainer(
              context,
              () {},
              Assets.icons.google,
              'Google',
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        // Don't have an account? Sign up
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account? ",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.grey800,
                  ),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(LoginPage.routePath);
              },
              child: Text(
                "Sign in",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.primary90,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSocialContainer(BuildContext context, VoidCallback onPressed,
      AssetGenImage icon, String label) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.xs),
              color: AppColors.white,
              border: Border.all(
                color: AppColors.grey200,
              ),
              //  box shadow only bottom with color grey 200 and blur radius 30
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey200,
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // facebook icon
                icon.image(
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: AppSpacing.sm),
                // text Facebook
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.grey800,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            )),
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
