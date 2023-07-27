import 'package:delivery_app/routers/router.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../payment/providers/payment_providers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...PaymentProviders.providers,
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        highlightColor: AppColors.primary10,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.xxxlg),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.white,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.grey400,
              ),
          // border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.xxxlg),
            borderSide: BorderSide(
              color: AppColors.grey200,
              width: 1,
            ),
          ),
          // enable border when focused
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.xxxlg),
            borderSide: BorderSide(
              color: AppColors.grey200,
              width: 1,
            ),
          ),
          // focused border
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.xxxlg),
            borderSide: BorderSide(
              color: AppColors.grey200,
              width: 1,
            ),
          ),
          // error border
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpacing.xxxlg),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xlg,
            vertical: 18,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.splashColor,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.primary70,
              // Set your desired border color here
              width: 1.0, // Set the border width
            ),
            borderRadius: BorderRadius.circular(AppSpacing.xxs),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: MyRouter.instance,
      builder: (context, child) {
        return GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: Center(
            child: Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: LoadingIndicator(
                  indicatorType: Indicator.lineScalePulseOutRapid,

                  /// Required, The loading type of the widget
                  colors: [
                    AppColors.primary,
                    AppColors.primary70,
                    AppColors.primary50,
                    AppColors.primary30,
                    AppColors.primary10,
                  ],

                  /// Optional, The color collections
                  strokeWidth: 2,

                  /// Optional, The stroke of the line, only applicable to widget which contains line
                  backgroundColor: Colors.transparent,

                  /// Optional, Background of the widget
                  pathBackgroundColor: Colors.black

                  /// Optional, the stroke backgroundColor
                  ),
            ),
          ),
          overlayOpacity: 0.1,
          child: child!,
        );
      },
    );
  }
}
