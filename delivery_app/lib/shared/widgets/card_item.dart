import 'package:delivery_app/shared/app_ui.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.item,
  });

  final PopularRestaurantModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: AppSpacing.md,
      ),
      width: MediaQuery.of(context).size.width * .4,
      padding: EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSpacing.md,
        ),
        color: AppColors.white,
        boxShadow: [
          // shadow bottom and right with color grey 200 and blur radius 30
          BoxShadow(
            color: AppColors.grey200,
            blurRadius: 80,
            offset: Offset(10, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // image
          Container(
            width: MediaQuery.of(context).size.width * .15,
            height: MediaQuery.of(context).size.width * .15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppSpacing.md,
              ),
              image: DecorationImage(
                image: item.image
                    .image(
                      width: 72,
                      height: 72,
                    )
                    .image,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.md),
          // title
          Text(
            item.title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: AppFontWeight.semiBold,
                ),
          ),
          SizedBox(height: AppSpacing.sm),
          // status
          Text(
            item.status,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.grey500,
                ),
          ),
        ],
      ),
    );
  }
}
