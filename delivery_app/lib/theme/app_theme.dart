// import 'package:delivery_app/shared/app_ui.dart';
// import 'package:flutter/material.dart';
//
// class AppTheme {
//   /// {@macro app_theme}
//   const AppTheme();
//
//   /// Default `ThemeData` for App UI.
//   ThemeData get themeData {
//     return ThemeData(
//       primaryColor: AppColors.primary80,
//       canvasColor: _backgroundColor,
//       scaffoldBackgroundColor: _backgroundColor,
//       iconTheme: _iconTheme,
//       appBarTheme: _appBarTheme,
//       dividerTheme: _dividerTheme,
//       textTheme: _textTheme,
//       inputDecorationTheme: _inputDecorationTheme,
//       buttonTheme: _buttonTheme,
//       splashColor: Colors.transparent,
//       snackBarTheme: _snackBarTheme,
//       elevatedButtonTheme: _elevatedButtonTheme,
//       textButtonTheme: _textButtonTheme,
//       colorScheme: _colorScheme,
//       bottomSheetTheme: _bottomSheetTheme,
//       listTileTheme: _listTileTheme,
//       switchTheme: _switchTheme,
//       progressIndicatorTheme: _progressIndicatorTheme,
//       tabBarTheme: _tabBarTheme,
//       bottomNavigationBarTheme: _bottomAppBarTheme,
//       chipTheme: _chipTheme,
//       floatingActionButtonTheme: _floatingActionButtonTheme,
//       fontFamily: FontFamily.kantumruyPro,
//     );
//   }
//
//   ColorScheme get _colorScheme {
//     return ColorScheme.light(
//       secondary: AppColors.secondary90,
//       background: _backgroundColor,
//     );
//   }
//
//   SnackBarThemeData get _snackBarTheme {
//     return SnackBarThemeData(
//       contentTextStyle: UITextStyle.bodyText1.copyWith(
//         color: AppColors.white,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(AppSpacing.sm),
//       ),
//       elevation: 4,
//       behavior: SnackBarBehavior.floating,
//     );
//   }
//
//   Color get _backgroundColor => AppColors.white;
//
//   AppBarTheme get _appBarTheme {
//     return AppBarTheme(
//       iconTheme: _iconTheme,
//       titleTextStyle: _textTheme.titleLarge,
//       elevation: 0,
//       toolbarHeight: 64,
//       backgroundColor: AppColors.white,
//       centerTitle: true,
//       shadowColor: AppColors.black.withOpacity(0.45),
//       systemOverlayStyle: const SystemUiOverlayStyle(
//         statusBarIconBrightness: Brightness.dark,
//         statusBarBrightness: Brightness.light,
//       ),
//     );
//   }
//
//
//   TextTheme get _textTheme => uiTextTheme;
//
//   /// The Content text theme based on [ContentTextStyle].
//   static final contentTextTheme = TextTheme(
//     displayLarge: ContentTextStyle.headline1,
//     displayMedium: ContentTextStyle.headline2,
//     displaySmall: ContentTextStyle.headline3,
//     headlineMedium: ContentTextStyle.headline4,
//     headlineSmall: ContentTextStyle.headline5,
//     titleLarge: ContentTextStyle.headline6,
//     titleMedium: ContentTextStyle.subtitle1,
//     titleSmall: ContentTextStyle.subtitle2,
//     bodyLarge: ContentTextStyle.bodyText1,
//     bodyMedium: ContentTextStyle.bodyText2,
//     labelLarge: ContentTextStyle.button,
//     bodySmall: ContentTextStyle.caption,
//     labelSmall: ContentTextStyle.overline,
//   ).apply(
//     bodyColor: AppColors.black,
//     displayColor: AppColors.black,
//     decorationColor: AppColors.black,
//   );
//   /// The UI text theme based on [UITextStyle].
//   static final uiTextTheme = TextTheme(
//     displayLarge: UITextStyle.headline1,
//     displayMedium: UITextStyle.headline2,
//     displaySmall: UITextStyle.headline3,
//     headlineMedium: UITextStyle.headline4,
//     headlineSmall: UITextStyle.headline5,
//     titleLarge: UITextStyle.headline6,
//     titleMedium: UITextStyle.subtitle1,
//     titleSmall: UITextStyle.subtitle2,
//     bodyLarge: UITextStyle.bodyText1,
//     bodyMedium: UITextStyle.bodyText2,
//     labelLarge: UITextStyle.button,
//     bodySmall: UITextStyle.caption,
//     labelSmall: UITextStyle.overline,
//   ).apply(
//     bodyColor: AppColors.black,
//     displayColor: AppColors.black,
//     decorationColor: AppColors.black,
//   );
//
//   InputDecorationTheme get _inputDecorationTheme {
//     return InputDecorationTheme(
//       suffixIconColor: AppColors.mediumEmphasisSurface,
//       prefixIconColor: AppColors.mediumEmphasisSurface,
//       hoverColor: AppColors.inputHover,
//       focusColor: AppColors.inputFocused,
//       fillColor: AppColors.white,
//       enabledBorder: _textFieldBorder,
//       focusedBorder: _textFieldBorder,
//       disabledBorder: _textFieldBorder,
//       hintStyle: UITextStyle.bodyText1.copyWith(
//         color: AppColors.mediumEmphasisSurface,
//       ),
//       labelStyle: UITextStyle.bodyText1.copyWith(
//         color: AppColors.primaryColor,
//         fontWeight: AppFontWeight.medium,
//       ),
//       contentPadding: const EdgeInsets.all(AppSpacing.lg),
//       border: const OutlineInputBorder(),
//       filled: true,
//       isDense: true,
//       errorStyle: UITextStyle.caption,
//     );
//   }
//
//   ButtonThemeData get _buttonTheme {
//     return ButtonThemeData(
//       textTheme: ButtonTextTheme.primary,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(AppSpacing.sm),
//       ),
//     );
//   }
//
//   ElevatedButtonThemeData get _elevatedButtonTheme {
//     return ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         shadowColor: Colors.transparent,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(AppSpacing.sm)),
//         ),
//         padding: const EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: AppSpacing.xlg,
//         ),
//         // textStyle: _textTheme.labelLarge,
//         backgroundColor: AppColors.primary80,
//       ),
//     );
//   }
//
//   TextButtonThemeData get _textButtonTheme {
//     return TextButtonThemeData(
//       style: TextButton.styleFrom(
//         textStyle: _textTheme.labelLarge?.copyWith(
//           fontWeight: AppFontWeight.light,
//         ),
//         foregroundColor: AppColors.primary80,
//         splashFactory: InkRipple.splashFactory,
//       ),
//     );
//   }
//
//   BottomSheetThemeData get _bottomSheetTheme {
//     return BottomSheetThemeData(
//       backgroundColor: AppColors.white,
//       clipBehavior: Clip.hardEdge,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(AppSpacing.lg),
//           topRight: Radius.circular(AppSpacing.lg),
//         ),
//       ),
//     );
//   }
//
//   ListTileThemeData get _listTileTheme {
//     return const ListTileThemeData(
//       iconColor: AppColors.onBackground,
//       contentPadding: EdgeInsets.all(AppSpacing.lg),
//     );
//   }
//
//   SwitchThemeData get _switchTheme {
//     return SwitchThemeData(
//       thumbColor:
//       MaterialStateProperty.resolveWith((Set<MaterialState> states) {
//         if (states.contains(MaterialState.selected)) {
//           return AppColors.darkAqua;
//         }
//         return AppColors.eerieBlack;
//       }),
//       trackColor:
//       MaterialStateProperty.resolveWith((Set<MaterialState> states) {
//         if (states.contains(MaterialState.selected)) {
//           return AppColors.primaryContainer;
//         }
//         return AppColors.paleSky;
//       }),
//     );
//   }
//
//   ProgressIndicatorThemeData get _progressIndicatorTheme {
//     return const ProgressIndicatorThemeData(
//       color: AppColors.darkAqua,
//       circularTrackColor: AppColors.borderOutline,
//     );
//   }
//
//   TabBarTheme get _tabBarTheme {
//     return TabBarTheme(
//       labelStyle: UITextStyle.button,
//       labelColor: AppColors.darkAqua,
//       labelPadding: const EdgeInsets.symmetric(
//         horizontal: AppSpacing.lg,
//         vertical: AppSpacing.md + AppSpacing.xxs,
//       ),
//       unselectedLabelStyle: UITextStyle.button,
//       unselectedLabelColor: AppColors.grey200,
//       indicator: UnderlineTabIndicator(
//         borderSide: BorderSide(
//           width: 3,
//           color: AppColors.primary80,
//         ),
//       ),
//       indicatorSize: TabBarIndicatorSize.label,
//     );
//   }
//
//   FloatingActionButtonThemeData get _floatingActionButtonTheme {
//     return FloatingActionButtonThemeData(
//       backgroundColor: AppColors.primary80,
//       foregroundColor: AppColors.white,
//       splashColor: AppColors.primary20,
//       elevation: 0,
//       highlightElevation: 0,
//     );
//   }
// }
