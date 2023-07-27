import 'package:delivery_app/gen/assets.gen.dart';
import 'package:delivery_app/message/widget/start_calling.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class MessageDetail extends StatefulWidget {
  const MessageDetail({super.key});

  static const String routePath = '/message-detail';

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Chat',
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // header
                        // display profile image and name ,status online and button call
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSpacing.md,
                                vertical: AppSpacing.md,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey100,
                                    blurRadius: 80,
                                    offset: Offset(10, 10),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // profile image
                                  CircleAvatar(
                                    radius: constraints.maxWidth * .07,
                                    backgroundImage:
                                    Assets.images.maww
                                        .image()
                                        .image,
                                  ),
                                  const SizedBox(width: AppSpacing.md),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Roseanne Park',
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            fontWeight:
                                            AppFontWeight.semiBold,
                                          ),
                                        ),
                                        const SizedBox(height: AppSpacing.xxs),
                                        Text(
                                          'Online',
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                            color: AppColors.success80,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // button call
                                  GestureDetector(
                                    onTap: () {
                                      GoRouter.of(context)
                                          .push(StartCalling.routePath);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(AppSpacing.sm),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primary08,
                                      ),
                                      child: Icon(
                                        Icons.call,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // list message left background grey 100 and right background primary
                          ],
                        ),
                        // text field and button send
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                            vertical: AppSpacing.md,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey100,
                                blurRadius: 80,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Type a message',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: AppSpacing.md),
                                    Container(
                                      padding: EdgeInsets.all(AppSpacing.sm),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primary08,
                                      ),
                                      child: Icon(
                                        Icons.send_rounded,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
