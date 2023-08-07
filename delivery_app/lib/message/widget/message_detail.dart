import 'package:delivery_app/gen/assets.gen.dart';
import 'package:delivery_app/message/widget/start_calling.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class ChatMessage {
  final String message;
  final bool isSender;
  final int userId; // 0 = sender, 1 = receiver

  ChatMessage({
    required this.message,
    required this.isSender,
    required this.userId,
  });

  // LIST OF CHAT MESSAGE
  static List<ChatMessage> messages = [
    ChatMessage(
      message: 'Hello, how are you?',
      isSender: false,
      userId: 1,
    ),
    // ChatMessage(
    //   message: 'I\'m fine, thank you. And you?',
    //   isSender: true,
    //   userId: 0,
    // ),
    // ChatMessage(
    //   message: 'I\'m fine too. What are you doing?',
    //   isSender: false,
    //   userId: 1,
    // ),
    // ChatMessage(
    //   message: 'I\'m working on my project.',
    //   isSender: true,
    //   userId: 0,
    // ),
    // ChatMessage(
    //   message: 'Oh, what project?',
    //   isSender: false,
    //   userId: 1,
    // ),
    // ChatMessage(
    //   message: 'I\'m working on my project.',
    //   isSender: true,
    //   userId: 0,
    // ),
    // ChatMessage(
    //   message: 'Oh, what project?',
    //   isSender: false,
    //   userId: 1,
    // ),
    // ChatMessage(
    //   message: 'I\'m working on my project.',
    //   isSender: true,
    //   userId: 0,
    // ),
    // ChatMessage(
    //   message: 'Oh, what project?',
    //   isSender: false,
    //   userId: 1,
    // ),
    // ChatMessage(
    //   message: 'I\'m working on my project.',
    //   isSender: true,
    //   userId: 0,
    // ),
    // ChatMessage(
    //   message: 'Oh, what project?',
    //   isSender: false,
    //   userId: 1,
    // ),
    // ChatMessage(
    //   message: 'I\'m working on my project.',
    //   isSender: true,
    //   userId: 0,
    // ),
    // ChatMessage(
    //   message: 'Oh, what project?',
    //   isSender: false,
    //   userId: 1,
    // ),
    // ChatMessage(
    //   message: 'I\'m working on my project.',
    //   isSender: true,
    //   userId: 0,
    // ),
    // ChatMessage(
    //   message: 'Oh, what project?',
    //   isSender: false,
    //   userId: 1,
    // ),
  ];
}

class MessageDetail extends StatefulWidget {
  const MessageDetail({super.key});

  static const String routePath = '/message-detail';

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  late TextEditingController _message;
  bool _isMessageEmpty = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _message = TextEditingController();
    _scrollController = ScrollController();
  }

  // reply message
  void _replyMessage() {
    Future.delayed(
      Duration(milliseconds: 200),
      () {
        ChatMessage.messages.add(
          ChatMessage(
            message: 'Hello, how are you?',
            isSender: false,
            userId: 1,
          ),
        );
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 60,
          duration: Duration(
            milliseconds: 300,
          ),
          curve: Curves.easeOut,
        );
      },
    );
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // list message using list generator
              SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.md,
                ),
                child: Column(
                  children: [
                    ...List.generate(
                      ChatMessage.messages.length,
                      (index) {
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: AppSpacing.md,
                          ),
                          child: Row(
                            mainAxisAlignment:
                                ChatMessage.messages[index].isSender
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                            children: [
                              // message
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSpacing.md,
                                  vertical: AppSpacing.sm,
                                ),
                                decoration: BoxDecoration(
                                  color: ChatMessage.messages[index].isSender
                                      ? AppColors.primary
                                      : AppColors.grey100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  ChatMessage.messages[index].message,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color:
                                            ChatMessage.messages[index].isSender
                                                ? AppColors.white
                                                : AppColors.grey900,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 68),
                  ],
                ),
              ),
              // bottom text field and button send
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: AppColors.grey50,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.md,
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
                                // WHEN KEY BOARD OPEN CONTROLLER TO BOTTOM
                                onTap: () {
                                  _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent +
                                        60,
                                    duration: Duration(
                                      milliseconds: 1,
                                    ),
                                    curve: Curves.easeOut,
                                  );
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: _isMessageEmpty
                                  ? () {
                                      print('send message');
                                      // add message to list
                                      setState(
                                        () {
                                          ChatMessage.messages.add(
                                            ChatMessage(
                                              message: _message.text,
                                              isSender: true,
                                              userId: 0,
                                            ),
                                          );
                                          _message.clear();
                                          _isMessageEmpty = false;

                                          // scroll to bottom
                                          _scrollController.animateTo(
                                            _scrollController
                                                    .position.maxScrollExtent +
                                                60,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeOut,
                                          );

                                          // CLOSE KEYBOARD
                                          FocusScope.of(context).unfocus();

                                          // delay to send message from with correct response message
                                        },
                                      );
                                      _replyMessage();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
