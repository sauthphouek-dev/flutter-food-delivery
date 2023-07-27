//
// import 'package:flutter/material.dart';
//
// import '../shared/app_ui.dart';
// import 'app_theme.dart';
//
// /// {@template app_dark_theme}
// /// Dark Mode App [ThemeData].
// /// {@endtemplate}
// class AppDarkTheme extends AppTheme {
//   /// {@macro app_dark_theme}
//   const AppDarkTheme();
//
//   @override
//   ColorScheme get _colorScheme {
//     return const ColorScheme.dark().copyWith(
//       primary: AppColors.white,
//       secondary: AppColors.secondary,
//       background: AppColors.grey.shade900,
//     );
//   }
//
//   @override
//   TextTheme get _textTheme {
//     return AppTheme.contentTextTheme.apply(
//       bodyColor: AppColors.white,
//       displayColor: AppColors.white,
//       decorationColor: AppColors.white,
//     );
//   }
//
//   @override
//   SnackBarThemeData get _snackBarTheme {
//     return SnackBarThemeData(
//       contentTextStyle: UITextStyle.bodyText1.copyWith(
//         color: AppColors.black,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(AppSpacing.sm),
//       ),
//       actionTextColor: AppColors.lightBlue.shade300,
//       backgroundColor: AppColors.grey.shade300,
//       elevation: 4,
//       behavior: SnackBarBehavior.floating,
//     );
//   }
//
//   @override
//   TextButtonThemeData get _textButtonTheme {
//     return TextButtonThemeData(
//       style: TextButton.styleFrom(
//         textStyle: _textTheme.labelLarge?.copyWith(
//           fontWeight: AppFontWeight.light,
//         ),
//         foregroundColor: AppColors.white,
//       ),
//     );
//   }
//
//   @override
//   Color get _backgroundColor => AppColors.grey.shade900;
//
//   @override
//   IconThemeData get _iconTheme {
//     return const IconThemeData(color: AppColors.white);
//   }
//
//   @override
//   DividerThemeData get _dividerTheme {
//     return const DividerThemeData(
//       color: AppColors.onBackground,
//       space: AppSpacing.lg,
//       thickness: AppSpacing.xxxs,
//       indent: AppSpacing.lg,
//       endIndent: AppSpacing.lg,
//     );
//   }
// }
