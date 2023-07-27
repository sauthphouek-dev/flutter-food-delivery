import 'package:delivery_app/shared/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.xxxlg),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Text('Search'),
                  Spacer(),
                  Icon(
                    IconlyLight.search,
                    color: AppColors.grey500,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(AppSpacing.md),
            margin: EdgeInsets.only(left: AppSpacing.md),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.lg),
              color: AppColors.primary10,
            ),
            child: Icon(
              Icons.menu,
              color: AppColors.primary,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
