import 'package:delivery_app/address/address.dart';
import 'package:delivery_app/bio/bio.dart';
import 'package:delivery_app/congrats/congrats.dart';
import 'package:delivery_app/forgot_password/forgot_password.dart';
import 'package:delivery_app/get_started/get_started.dart';
import 'package:delivery_app/home/widgets/popular_menu.dart';
import 'package:delivery_app/home/widgets/popular_restaurant.dart';
import 'package:delivery_app/login/login.dart';
import 'package:delivery_app/message/widget/message_detail.dart';
import 'package:delivery_app/message/widget/start_calling.dart';
import 'package:delivery_app/payment/payment.dart';
import 'package:delivery_app/reset_password/reset_password.dart';
import 'package:delivery_app/sign_up/sign_up.dart';
import 'package:delivery_app/upload_photo/upload_photo.dart';
import 'package:delivery_app/verify_otp/verify_otp.dart';
import 'package:go_router/go_router.dart';

import '../main/view/view.dart';

class MyRouter {
  MyRouter._();

  static final GoRouter instance = GoRouter(
    routes: [
      // GoRoute(
      //   path: SplashScreenPage.routePath,
      //   builder: (context, state) => const SplashScreenPage(),
      // ),
      GoRoute(
        path: MainPage.routePath,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: GetStartedPage.routePath,
        builder: (context, state) => const GetStartedPage(),
      ),
      GoRoute(
        path: LoginPage.routePath,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: SignUpPage.routePath,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: BioPage.routePath,
        builder: (context, state) => const BioPage(),
      ),
      GoRoute(
        path: PaymentPage.routePath,
        builder: (context, state) => const PaymentPage(),
      ),
      GoRoute(
        path: UploadPhotoPage.routePath,
        builder: (context, state) => const UploadPhotoPage(),
      ),
      GoRoute(
        path: ForgotPasswordPage.routePath,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: VerifyOtpPage.routePath,
        builder: (context, state) => const VerifyOtpPage(),
      ),
      GoRoute(
        path: ResetPasswordPage.routePath,
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: CongratsPage.routePath,
        builder: (context, state) => const CongratsPage(),
      ),
      GoRoute(
        path: PopularMenuPage.routePath,
        builder: (context, state) => const PopularMenuPage(),
      ),
      GoRoute(
        path: PopularRestaurant.routePath,
        builder: (context, state) => const PopularRestaurant(),
      ),
      GoRoute(
        path: MessageDetail.routePath,
        builder: (context, state) => const MessageDetail(),
      ),
      GoRoute(
        path: StartCalling.routePath,
        builder: (context, state) => const StartCalling(),
      ),
      GoRoute(
        path: AddressPage.routePath,
        builder: (context, state) => const AddressPage(),
      ),
    ],
  );
}
