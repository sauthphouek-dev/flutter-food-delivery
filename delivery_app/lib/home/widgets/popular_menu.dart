import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/card_list_tile.dart';
import 'package:delivery_app/shared/widgets/custom_app_bar.dart';
import 'package:delivery_app/shared/widgets/search_widget.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';

class PopularMenuPage extends StatelessWidget {
  const PopularMenuPage({super.key});

  static const String routePath = '/popular-menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Popular Menu',
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
              child: Column(
                children: [
                  ...List.generate(
                    PopularMenu.menus.length,
                    (index) {
                      final item = PopularMenu.menus[index];
                      // using with listile
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: AppSpacing.md,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.md,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppSpacing.md,
                          ),
                          color: AppColors.white,
                          boxShadow: [
                            // shadow bottom and right with color grey 200 and blur radius 30
                            BoxShadow(
                              color: AppColors.grey100,
                              blurRadius: 80,
                              offset: Offset(10, 10),
                            ),
                          ],
                        ),
                        child: CardListTile(item: item),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
