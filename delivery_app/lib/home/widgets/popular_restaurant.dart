import 'package:delivery_app/model/model.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/card_item.dart';
import 'package:delivery_app/shared/widgets/custom_app_bar.dart';
import 'package:delivery_app/shared/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class PopularRestaurant extends StatelessWidget {
  const PopularRestaurant({super.key});

  static const String routePath = '/popular-restaurant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      appBar: CustomAppBar(
        title: 'Popular Restaurant',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.lg),
            SearchWidget(),
            const SizedBox(height: AppSpacing.xxlg),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PopularRestaurantModel.list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.xlg,
                  mainAxisExtent: MediaQuery.of(context).size.width * .48,
                ),
                itemBuilder: (context, index) {
                  return CardItem(item: PopularRestaurantModel.list[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
