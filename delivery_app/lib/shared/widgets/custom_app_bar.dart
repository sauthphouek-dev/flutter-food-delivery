import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app_ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.color = Colors.transparent,
  });

  final String title;
  final Color color;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
      ),
      centerTitle: false,
      backgroundColor: color,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Container(
          margin: const EdgeInsets.only(left: 20, top: 14, bottom: 14),
          decoration: BoxDecoration(
            color: AppColors.primary08,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.primary90,
            size: 16,
          ),
        ),
      ),
    );
  }
}
