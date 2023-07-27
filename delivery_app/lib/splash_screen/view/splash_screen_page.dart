import 'package:delivery_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../splash_screen.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  static const String routePath = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashScreenCubit(),
      child: const SplashScreenView(),
    );
  }
}

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.backgroundLight.image(
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            colorBlendMode: BlendMode.softLight,
          ),
          Center(
            child: Assets.images.logo.image(
              width: 260,
              height: 260,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
