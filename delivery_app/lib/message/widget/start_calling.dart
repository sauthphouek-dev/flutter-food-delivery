import 'package:delivery_app/gen/assets.gen.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class StartCalling extends StatefulWidget {
  const StartCalling({super.key});

  static const String routePath = '/start-calling';

  @override
  State<StartCalling> createState() => _StartCallingState();
}

class _StartCallingState extends State<StartCalling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              maxHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Container(
                // background image
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Assets.images.backgroundLight.image().image,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    scale: 1.0,
                    opacity: 0.3,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    // profile image with border width 5 and color primary
                    Column(
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.width * .4,
                                width: MediaQuery.of(context).size.width * .4,
                                child: LoadingIndicator(
                                  indicatorType: Indicator.ballScale,

                                  /// Required, The loading type of the widget
                                  colors: [
                                    AppColors.primary,
                                    AppColors.primary70,
                                    AppColors.primary50,
                                    AppColors.primary30,
                                    AppColors.primary10,
                                  ],
                                ),
                              ),
                            ),
                            // profile image at center
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: constraints.maxWidth * .07,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 5,
                                    color: AppColors.primary80,
                                  ),
                                  // animated border
                                ),
                                child: CircleAvatar(
                                  radius: constraints.maxWidth * .12,
                                  backgroundImage:
                                      Assets.images.maww.image().image,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.lg),
                        // name
                        Text(
                          'Roseanne Park',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: AppFontWeight.bold,
                                  ),
                        ),
                        SizedBox(height: AppSpacing.lg),
                        // status online
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Ringing',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.grey500,
                                  ),
                            ),
                            const SizedBox(width: AppSpacing.xxs),
                            SizedBox(
                              height: AppSpacing.lg,
                              width: AppSpacing.lg,
                              child: LoadingIndicator(
                                  indicatorType: Indicator.ballPulse,

                                  /// Required, The loading type of the widget
                                  colors: [AppColors.grey500],

                                  /// Optional, The color collections
                                  strokeWidth: 1,

                                  /// Optional, The stroke of the line, only applicable to widget which contains line
                                  backgroundColor: Colors.transparent,

                                  /// Optional, Background of the widget
                                  pathBackgroundColor: Colors.black

                                  /// Optional, the stroke backgroundColor
                                  ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),

                    // two buttons with iconly icon phone and video call with background color primary and white
                    SafeArea(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.md,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // button phone call
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary08,
                                ),
                                child: Icon(
                                  Icons.cancel,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.xxlg),
                            // button video call
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.success20,
                              ),
                              child: Icon(
                                Icons.call,
                                color: AppColors.success90,
                              ),
                            ),
                            // animated container with width 80 and height 80
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
