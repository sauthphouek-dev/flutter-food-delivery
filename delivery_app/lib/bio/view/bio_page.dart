import 'package:delivery_app/payment/payment.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:delivery_app/shared/widgets/elevated_button_action.dart';
import 'package:delivery_app/shared/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../bio.dart';

class BioPage extends StatelessWidget {
  const BioPage({super.key});

  static const String routePath = '/bio';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BioCubit(),
      child: const BioView(),
    );
  }
}

class GenderModel {
  final int value;
  final String label;

  const GenderModel({required this.value, required this.label});
}

class BioView extends StatefulWidget {
  const BioView({super.key});

  @override
  State<BioView> createState() => _BioViewState();
}

class _BioViewState extends State<BioView> {
  late TextEditingController _fullName;
  late TextEditingController _nickName;
  late TextEditingController _phoneNumber;
  late TextEditingController _address;
  late TextEditingController _gender;
  late TextEditingController _dateOfBirth;

  List<GenderModel> _genders = [
    GenderModel(value: 1, label: 'Female'),
    GenderModel(value: 2, label: 'Male'),
    GenderModel(value: 3, label: 'Other'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullName = TextEditingController();
    _nickName = TextEditingController();
    _phoneNumber = TextEditingController();
    _address = TextEditingController();
    _gender = TextEditingController();
    _dateOfBirth = TextEditingController();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: true,
      // border radius only top
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      barrierColor: Colors.black.withOpacity(.3),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // text select your gender
              Text(
                'Select your gender',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: AppSpacing.md),
              ...List.generate(_genders.length, (index) {
                final gender = _genders[index];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.sm),
                  ),
                  splashColor: AppColors.splashColor,
                  title: Text(gender.label),
                  onTap: () {
                    // Handle when a gender is tapped
                    Navigator.pop(context); // Close the bottom sheet
                    // Do something with the selected gender
                    print('Selected gender: ${gender.label}');
                    setState(() {
                      _gender.text = gender.label;
                    });
                  },
                  trailing: Icon(Icons.circle_outlined),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  void _showDatePicker() {
    // DatePicker.showDatePicker(
    //   context,
    //   showTitleActions: true,
    //   minTime: DateTime(1697),
    //   maxTime: DateTime.now(),
    //   onChanged: (date) {
    //     print('Selected date: $date');
    //   },
    //   onConfirm: (date) {
    //     setState(() {
    //       final formattedDate = date.toString().split(' ')[0].split('-');
    //       // format to August 25, 1995
    //       _dateOfBirth.text = DateFormat('MMMM dd, yyyy').format(
    //         DateTime(
    //           int.parse(formattedDate[0]),
    //           int.parse(formattedDate[1]),
    //           int.parse(formattedDate[2]),
    //         ),
    //       );
    //     });
    //   },
    //   currentTime: DateTime.now(),
    //   locale: LocaleType.en,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Fill in your bio',
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'This data will be displayed in your account profile for security',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.xxlg),
                  // full name
                  buildAlignLabel(context, 'Full name'),
                  const SizedBox(height: AppSpacing.xxs),
                  InputTextFormField(
                    controller: _fullName,
                    hintText: 'Full name',
                  ),
                  // nick name
                  const SizedBox(height: AppSpacing.lg),
                  buildAlignLabel(context, 'Nick name'),
                  const SizedBox(height: AppSpacing.xxs),
                  InputTextFormField(
                    controller: _nickName,
                    hintText: 'Nick name',
                  ),

                  // phone
                  const SizedBox(height: AppSpacing.lg),
                  buildAlignLabel(context, 'Phone number'),
                  const SizedBox(height: AppSpacing.xxs),
                  InputTextFormField(
                    controller: _phoneNumber,
                    hintText: 'Phone number',
                  ),
                  // gender
                  const SizedBox(height: AppSpacing.lg),
                  buildAlignLabel(context, 'Gender'),
                  const SizedBox(height: AppSpacing.xxs),
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
                      controller: _gender,
                      readOnly: true,
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      decoration: InputDecoration(
                        hintText: 'Select gender',
                        suffixIcon: Icon(IconlyBold.arrowDown2),
                      ),
                    ),
                  ),

                  // date of birth
                  const SizedBox(height: AppSpacing.lg),
                  buildAlignLabel(context, 'Date of birth'),
                  const SizedBox(height: AppSpacing.xxs),
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
                      controller: _dateOfBirth,
                      readOnly: true,
                      onTap: _showDatePicker,
                      decoration: InputDecoration(
                        hintText: 'Select date of birth',
                        suffixIcon: Icon(IconlyLight.calendar),
                      ),
                    ),
                  ),

                  // address
                  const SizedBox(height: AppSpacing.lg),
                  buildAlignLabel(context, 'Address'),
                  const SizedBox(height: AppSpacing.xxs),
                  InputTextFormField(
                    controller: _address,
                    hintText: 'Address',
                  ),

                  // button
                  const SizedBox(height: AppSpacing.xxlg),
                  ElevatedButtonAction(
                    title: 'Next',
                    onTap: () {
                      GoRouter.of(context).push(PaymentPage.routePath);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align buildAlignLabel(BuildContext context, String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.md),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: AppFontWeight.semiBold,
                color: AppColors.grey700,
              ),
        ),
      ),
    );
  }
}
