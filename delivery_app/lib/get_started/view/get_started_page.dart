import 'package:delivery_app/gen/assets.gen.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/elevated_button_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../get_started.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  static const String routePath = '/get_started';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetStartedCubit(),
      child: const GetStartedView(),
    );
  }
}

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // image background
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.backgroundDark.image().image,
          fit: BoxFit.cover,

          /// dark background at the bottom
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // text Food
                Text(
                  "Food",
                  style: TextStyle(
                    fontSize: AppSpacing.xxlg,
                    fontWeight: AppFontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  textAlign: TextAlign.center,
                  "The best food ordering and delivery app of the century",
                  style: TextStyle(
                    fontSize: AppSpacing.lg,
                    fontWeight: AppFontWeight.medium,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxxlg),
                // button Next
                ElevatedButtonAction(
                  title: 'Get Started',
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
