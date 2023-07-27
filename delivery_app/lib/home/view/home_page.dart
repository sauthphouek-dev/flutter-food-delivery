import 'package:delivery_app/home/widgets/popular_menu.dart';
import 'package:delivery_app/home/widgets/popular_restaurant.dart';
import 'package:delivery_app/model/model.dart';
import 'package:delivery_app/model/response/food_model.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/card_item.dart';
import 'package:delivery_app/shared/widgets/card_list_tile.dart';
import 'package:delivery_app/shared/widgets/network_image.dart';
import 'package:delivery_app/shared/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      appBar: AppBar(
        toolbarHeight: 64,
        leading: Container(
          margin: EdgeInsets.only(
            left: AppSpacing.md,
            top: AppSpacing.md,
            bottom: AppSpacing.md,
          ),
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.lg),
            color: AppColors.primary90,
          ),
          child: SvgPicture.asset(
            Assets.svg.menu,
          ),
        ),
        centerTitle: false,
        title: Text(
          'Hello, Shaut Smos!',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: AppFontWeight.bold,
              ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.md),
              color: AppColors.primary08,
            ),
            margin: EdgeInsets.only(
              right: AppSpacing.md,
              top: AppSpacing.md,
              bottom: AppSpacing.md,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyBold.notification,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // search bar
              SizedBox(height: AppSpacing.lg),
              SearchWidget(),
              SizedBox(height: AppSpacing.lg),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.lg),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topLeft,
                    colors: [
                      AppColors.primary,
                      AppColors.primary80,
                    ],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.draftHumbergure.image(
                      fit: BoxFit.fitHeight,
                      width: MediaQuery.of(context).size.width * .4,
                    ),
                    SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Special Deal for December',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: AppFontWeight.semiBold,
                                  height: 1.8,
                                ),
                          ),
                          SizedBox(height: AppSpacing.md),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondary80,
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.xlg,
                                vertical: AppSpacing.sm,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSpacing.xxlg,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text('Buy now'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.lg),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                ),
                child: Row(
                  children: [
                    Text(
                      'Popular Restaurant',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: AppFontWeight.semiBold,
                          ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(
                          PopularRestaurant.routePath,
                        );
                      },
                      child: Text(
                        'See all',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.primary,
                              fontWeight: AppFontWeight.semiBold,
                            ),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  vertical: AppSpacing.md,
                ),
                child: Row(
                  children: [
                    ...List.generate(
                      PopularRestaurantModel.list.length,
                      (index) {
                        final item = PopularRestaurantModel.list[index];
                        // container border radius md dispaly column image, title, status,
                        return CardItem(item: item);
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.md,
                ),
                child: Text(
                  'Popular Menu',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: AppFontWeight.semiBold,
                      ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      PopularMenu.menus.length,
                      (index) {
                        final item = PopularMenu.menus[index];
                        // using with listile
                        if (index < 4) {
                          return Container(
                            width: MediaQuery.of(context).size.width * .8,
                            margin: EdgeInsets.only(
                              left: AppSpacing.md,
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
                        }
                        if (index == 4)
                          return GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(
                                PopularMenuPage.routePath,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                left: AppSpacing.lg,
                                right: AppSpacing.xlg,
                              ),
                              padding: EdgeInsets.all(AppSpacing.md),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
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
                              child: Icon(
                                Icons.arrow_forward,
                                color: AppColors.primary,
                              ),
                            ),
                          );

                        return const SizedBox();
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.md,
                ),
                child: Text(
                  'Hot selling',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: AppFontWeight.semiBold,
                      ),
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      FoodModel.foodList.length,
                      (index) {
                        final item = FoodModel.foodList[index];
                        if (index < 4)
                          return Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .46,
                                margin: EdgeInsets.only(
                                  left: AppSpacing.md,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: NetworkImageShow(
                                        imagePath: item.image,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .46,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  fontWeight:
                                                      AppFontWeight.semiBold,
                                                ),
                                          ),
                                          SizedBox(height: AppSpacing.sm),
                                          Text(
                                            '\$${item.price}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: AppColors.primary,
                                                  fontWeight:
                                                      AppFontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 6,
                                right: 6,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppSpacing.sm,
                                    vertical: AppSpacing.xs,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppSpacing.md,
                                    ),
                                    // check status if new background primary else if best background secondary else if sale background primary
                                    color: item.status == 'New'
                                        ? AppColors.primary
                                        : item.status == 'Best'
                                            ? Colors.teal
                                            : Colors.red,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBold.star,
                                        color: AppColors.white,
                                        size: 12,
                                      ),
                                      SizedBox(width: AppSpacing.xs),
                                      Text(
                                        item.status.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColors.white,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        if (index == 4)
                          return Container(
                            margin: EdgeInsets.only(
                              left: AppSpacing.lg,
                              right: AppSpacing.xlg,
                            ),
                            padding: EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              boxShadow: [
                                // shadow bottom and right with color grey 200 and blur radius 30
                                BoxShadow(
                                  color: AppColors.grey500,
                                  blurRadius: 80,
                                  offset: Offset(10, 10),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppColors.primary,
                            ),
                          );

                        return const SizedBox();
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xxlg),
            ],
          ),
        ),
      ),
    );
  }
}
