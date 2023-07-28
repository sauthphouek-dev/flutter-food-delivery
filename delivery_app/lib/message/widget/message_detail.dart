import 'package:delivery_app/gen/assets.gen.dart';
import 'package:delivery_app/message/widget/start_calling.dart';
import 'package:delivery_app/shared/app_ui.dart';
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
  late TextEditingController _message;
  bool _isMessageEmpty = false;

  @override
  void initState() {
    super.initState();
    _message = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
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
        title: Container(
          margin: EdgeInsets.only(
            left: AppSpacing.md,
            top: AppSpacing.md,
            bottom: AppSpacing.md,
          ),
          child: Row(
            children: [
              // profile image
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * .07,
                backgroundImage: Assets.images.maww.image().image,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Roseanne Park',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: AppFontWeight.semiBold,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      'Online',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.success80,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(StartCalling.routePath);
            },
            child: Container(
              margin: EdgeInsets.only(
                right: AppSpacing.md,
              ),
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
                        const Spacer(),
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
                                        controller: _message,
                                        decoration: InputDecoration(
                                          hintText: 'Type a message',
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            if (value.isEmpty) {
                                              _isMessageEmpty = false;
                                            } else {
                                              _isMessageEmpty = true;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: _isMessageEmpty
                                          ? () {
                                              print('send message');
                                            }
                                          : null,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: AppSpacing.md,
                                        ),
                                        padding: EdgeInsets.all(AppSpacing.sm),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            AppSpacing.md,
                                          ),
                                          color: _isMessageEmpty
                                              ? AppColors.primary08
                                              : AppColors.grey200,
                                        ),
                                        child: Icon(
                                          IconlyLight.send,
                                          color: _isMessageEmpty
                                              ? AppColors.primary
                                              : AppColors.grey600,
                                        ),
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
