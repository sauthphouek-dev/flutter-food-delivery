import 'package:delivery_app/gen/assets.gen.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/elevated_button_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../congrats.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({super.key});

  static const String routePath = '/congrats';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CongratsCubit(),
      child: const CongratsView(),
    );
  }
}

class CongratsView extends StatelessWidget {
  const CongratsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.backgroundLight.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight -
                        MediaQuery.of(context).size.width * .1,
                    maxHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // flex 2 /3 image logo
                        const Spacer(),
                        Column(
                          children: [
                            Assets.images.success.image(
                              width: constraints.maxWidth * .4,
                              height: constraints.maxWidth * .4,
                            ),
                            const SizedBox(height: AppSpacing.xlg),
                            Text(
                              'Congratulations!',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary90,
                                  ),
                            ),
                            const SizedBox(height: AppSpacing.xlg),
                            Text(
                              'Password reset successfully.',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButtonAction(
                          title: 'OK',
                          onTap: () {
                            // context.go('/');
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
      ),
    );
  }
}
