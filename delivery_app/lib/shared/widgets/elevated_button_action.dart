import 'package:delivery_app/shared/app_ui.dart';
import 'package:flutter/material.dart';

class ElevatedButtonAction extends StatelessWidget {
  const ElevatedButtonAction({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .016,
          ),
          // background gradient
          backgroundColor: AppColors.primary90,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.white,
                fontWeight: AppFontWeight.semiBold,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
