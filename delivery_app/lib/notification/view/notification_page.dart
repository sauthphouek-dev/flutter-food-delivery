import 'package:delivery_app/gen/assets.gen.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/custom_app_bar.dart';
import 'package:delivery_app/shared/widgets/search_widget.dart';
import 'package:delivery_app/shared/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../notification.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static String routePath = '/notification';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationCubit(),
      child: const NotificationView(),
    );
  }
}

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      appBar: CustomAppBar(
        title: 'Notification',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
          ),
          child: Column(
            children: [
              // search
              SizedBox(height: AppSpacing.md),
              Container(
                // box shadow
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey200,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _searchController,
                  cursorColor: AppColors.primary90,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    focusColor: AppColors.primary90,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),

              ...List.generate(10, (index) {
                return Container(
                  margin: EdgeInsets.only(top: AppSpacing.md),
                  padding: EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppSpacing.md),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        offset: Offset(0, -1),
                        color: Colors.grey.shade200,
                        blurRadius: 80,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      //
                      Assets.images.success.image(
                        width: 56,
                        height: 56,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your order is completed',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            '20.00',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
