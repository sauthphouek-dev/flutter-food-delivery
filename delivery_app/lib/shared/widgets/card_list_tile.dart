import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:flutter/material.dart';
import '../../model/model.dart';

class CardListTile extends StatelessWidget {
  const CardListTile({
    super.key,
    required this.item,
  });

  final PopularMenu item;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // return ListTile(
    //   // contentPadding: EdgeInsets.zero,
    //   leading: Container(
    //     width: width * .12,
    //     height: width * .12,
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(AppSpacing.xs),
    //       child: NetworkImageShow(
    //         imagePath: item.image,
    //       ),
    //     ),
    //   ),
    //   title: Text(
    //     item.title,
    //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
    //           fontWeight: AppFontWeight.semiBold,
    //         ),
    //   ),
    //   subtitle: Text(
    //     item.description,
    //     style: Theme.of(context).textTheme.bodySmall!.copyWith(
    //           color: AppColors.grey400,
    //         ),
    //   ),
    //   trailing: Text(
    //     '\$${item.price}',
    //     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
    //           fontWeight: AppFontWeight.bold,
    //           color: AppColors.primary,
    //         ),
    //   ),
    // );

    return Container(
      margin: EdgeInsets.only(
        left: AppSpacing.md,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: width * .12,
                  height: width * .12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSpacing.xs),
                    child: NetworkImageShow(
                      imagePath: item.image,
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: AppFontWeight.semiBold,
                            ),
                      ),
                      SizedBox(height: AppSpacing.sm),
                      // description
                      Text(
                        item.description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.grey400,
                            ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: AppSpacing.md),
                // price
                Text(
                  '\$${item.price}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: AppFontWeight.bold,
                        color: AppColors.primary,
                      ),
                ),
              ],
            ),
          )
          // image
        ],
      ),
    );
  }
}
