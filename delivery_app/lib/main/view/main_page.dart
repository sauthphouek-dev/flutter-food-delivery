import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:delivery_app/chart/chart.dart';
import 'package:delivery_app/home/home.dart';
import 'package:delivery_app/shared/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:animations/animations.dart';

import '../../message/view/view.dart';
import '../../profile/view/view.dart';
import '../main.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String routePath = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(),
      child: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _pages = [
    HomePage(),
    ChartPage(),
    MessagePage(),
    ProfilePage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 360),
        transitionBuilder: (Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.md,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.lg),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 50,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: BottomNavyBar(
            selectedIndex: _currentIndex,
            showElevation: false,
            itemCornerRadius: 12,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: <BottomNavyBarItem>[
              buildBottomNavyBarItem(
                IconlyBold.home,
                'Home',
              ),
              buildBottomNavyBarItem(
                IconlyBold.buy,
                'Orders',
              ),
              buildBottomNavyBarItem(
                IconlyBold.message,
                'Message',
              ),
              buildBottomNavyBarItem(
                IconlyBold.profile,
                'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavyBarItem buildBottomNavyBarItem(IconData icon, String label) {
    return BottomNavyBarItem(
      textAlign: TextAlign.center,
      icon: Icon(icon),
      title: Text(
        label,
      ),
      activeColor: AppColors.primary80,
      inactiveColor: AppColors.primary80,
    );
  }
}
