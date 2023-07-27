import 'package:delivery_app/shared/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class InputTextFormField extends StatelessWidget {
  const InputTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.isVisible = false,
    this.toggle,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final bool isVisible;
  final VoidCallback? toggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      // box shadow
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.grey200,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: isVisible ? !obscureText : obscureText,
        controller: controller,
        cursorColor: AppColors.primary90,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: hintText,
          focusColor: AppColors.primary90,
          suffixIcon: obscureText
              ? IconButton(
                  splashRadius: 1,
                  icon: Icon(isVisible ? IconlyBold.show : IconlyBold.hide),
                  onPressed: toggle,
                )
              : null,
        ),
      ),
    );
  }
}
