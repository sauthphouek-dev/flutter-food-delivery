import 'package:delivery_app/address/address.dart';
import 'package:delivery_app/gen/assets.gen.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../chart.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChartCubit(),
      child: const ChartView(),
    );
  }
}

class ChartView extends StatelessWidget {
  const ChartView({super.key});

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
          'Cart',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: AppFontWeight.bold,
              ),
        ),
      ),
      body: OverflowBox(
        alignment: Alignment.topCenter,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey500,
                                ),
                                cursorColor: AppColors.primary,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Search',
                                  suffixIcon: Icon(
                                    IconlyLight.search,
                                    color: AppColors.grey500,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Container(
                              padding: EdgeInsets.all(AppSpacing.md),
                              margin: EdgeInsets.only(left: AppSpacing.md),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSpacing.lg),
                                color: AppColors.primary10,
                              ),
                              child: Icon(
                                Icons.menu,
                                color: AppColors.primary,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        ...List.generate(2, (index) {
                          return Container(
                            margin: EdgeInsets.only(top: AppSpacing.md),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppSpacing.md),
                              color: AppColors.primary08,
                            ),
                            child: Slidable(
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    flex: 2,
                                    onPressed: (context) {
                                      // alert bottom sheet
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft:
                                                Radius.circular(AppSpacing.xlg),
                                            topRight:
                                                Radius.circular(AppSpacing.xlg),
                                          ),
                                        ),
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: AppSpacing.md,
                                              vertical: AppSpacing.xs,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  height: 3,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppSpacing.xlg),
                                                    color: AppColors.grey300,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height: AppSpacing.md),
                                                // icon delete center
                                                Icon(
                                                  IconlyBold.delete,
                                                  color: AppColors.primary,
                                                  size: AppSpacing.xxlg,
                                                ),
                                                const SizedBox(
                                                    height: AppSpacing.md),
                                                Text(
                                                  'Are you sure you want to delete this item?',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    height: AppSpacing.xlg),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          context.pop();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              AppColors.white,
                                                          // border primary
                                                          side: BorderSide(
                                                            color: AppColors
                                                                .primary,
                                                            width: 1,
                                                          ),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical:
                                                                AppSpacing.md,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'No',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: AppColors
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        width: AppSpacing.md),
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical:
                                                                AppSpacing.md,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: AppSpacing.lg,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: AppColors.primary,
                                    icon: IconlyLight.delete,
                                    borderRadius:
                                        BorderRadius.circular(AppSpacing.md),
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: EdgeInsets.all(AppSpacing.md),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSpacing.md),
                                  color: AppColors.white,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppSpacing.md),
                                        image: DecorationImage(
                                          image:
                                              Assets.images.maww.image().image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: AppSpacing.md),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Chicken Burger',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              // color: AppColors.black,
                                            ),
                                          ),
                                          const SizedBox(height: AppSpacing.sm),
                                          Text(
                                            'Lorem ipsum dolor sit amet ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.grey500,
                                            ),
                                          ),
                                          const SizedBox(height: AppSpacing.sm),
                                          Text(
                                            '\$ 10.00',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: AppSpacing.md),
                                    // button decrement and increment with counter
                                    Row(
                                      children: [
                                        // button decrement with container
                                        Container(
                                          padding:
                                              EdgeInsets.all(AppSpacing.xs),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppSpacing.sm),
                                            color: AppColors.primary10,
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: AppColors.primary,
                                            size: 20,
                                          ),
                                        ),
                                        const SizedBox(width: AppSpacing.sm),
                                        // counter
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: AppSpacing.sm),
                                        // button increment with container
                                        Container(
                                          padding:
                                              EdgeInsets.all(AppSpacing.xs),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppSpacing.sm),
                                            color: AppColors.primary80,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const Spacer(),
                    Container(
                      margin: EdgeInsets.only(top: AppSpacing.md),
                      padding: EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSpacing.md),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary,
                            AppColors.primary80,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        children: [
                          // row subtotal and price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                '\$ 30.00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.md),
                          // row delivery charge and price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery charge',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                '\$ 5.00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.md),
                          // row discount and price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                '\$ 0.00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          // under line
                          Container(
                            height: 1,
                            color: AppColors.white,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          // row total and price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                '\$ 35.00',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          // button place order expanded elevated button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(AddressPage.routePath);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSpacing.xxxlg),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSpacing.md,
                                ),
                                child: Text(
                                  'Place my order',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
