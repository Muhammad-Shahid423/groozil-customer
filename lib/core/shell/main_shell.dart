import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/shell/widgets/bottom_nav_bar.dart';

class MainShell extends StatelessWidget {
  const MainShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsConstants.appBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: navigationShell
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(
              selectedIndex: navigationShell.currentIndex,
              onItemTap: _goBranch,
              onCartTap: NavigationService.goToCart,
              safeAreaBottom: bottomInset,
            ),
          ),
        ],
      ),
    );
  }
}
