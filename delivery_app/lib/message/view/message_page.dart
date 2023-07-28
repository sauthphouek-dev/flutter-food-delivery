import 'package:delivery_app/message/widget/message_detail.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../message.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MessageCubit(),
      child: const MessageView(),
    );
  }
}

class MessageView extends StatelessWidget {
  const MessageView({super.key});

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
          'Chat',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: AppFontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: AppSpacing.md,
          right: AppSpacing.md,
          top: AppSpacing.md,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    // controller: controller,
                    cursorColor: AppColors.primary90,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      focusColor: AppColors.primary90,
                      suffixIcon: Icon(IconlyLight.search),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.lg),
            ...List.generate(
              40,
              (index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(MessageDetail.routePath);
                  },
                  child: Container(
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
                    child: Row(
                      children: [
                        // clip image circle
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                            // random image with index
                            'https://picsum.photos/seed/$index/200/300',
                          ),
                        ),
                        SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // title
                              Text(
                                'John Doe',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: AppFontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: AppSpacing.sm),
                              // subtitle
                              Text(
                                'Lorem ipsum dolor sit amet,',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: AppSpacing.md),
                        Column(
                          children: [
                            Text(
                              '10:00',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.grey500,
                                  ),
                            ),
                            SizedBox(height: AppSpacing.sm),
                            Container(
                              padding: EdgeInsets.all(AppSpacing.xs),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary90,
                              ),
                              child: Center(
                                child: Text(
                                  index.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: AppColors.white,
                                        fontWeight: AppFontWeight.semiBold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
