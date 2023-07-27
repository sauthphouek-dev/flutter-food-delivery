import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../shared/widgets/elevated_button_action.dart';
import '../upload_photo.dart';

class UploadPhotoPage extends StatelessWidget {
  const UploadPhotoPage({super.key});

  static const String routePath = '/upload_photo';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UploadPhotoCubit(),
      child: const UploadPhotoView(),
    );
  }
}

class UploadPhotoView extends StatelessWidget {
  const UploadPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Upload your photo',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: AppSpacing.lg),
                        Text(
                          'This data will be displayed in your account profile for security',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                        ),
                        const SizedBox(height: AppSpacing.xxlg),
                        _UploadContainer(
                          title: 'Take photo',
                          icon: IconlyBold.camera,
                          onTap: () {
                            // open camera
                          },
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        _UploadContainer(
                          title: 'From gallery',
                          icon: IconlyBold.folder,
                          onTap: () {},
                        ),
                      ],
                    ),
                    ElevatedButtonAction(
                      title: 'Next',
                      onTap: () {},
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

class _UploadContainer extends StatelessWidget {
  const _UploadContainer({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

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
        child: Column(
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
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: AppFontWeight.semiBold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
