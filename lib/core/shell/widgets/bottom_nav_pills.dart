import 'package:flutter/material.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/shell/widgets/bottom_bar_item.dart';

class BottomNavPills extends StatelessWidget {
  const BottomNavPills({
    required this.selectedIndex,
    required this.onItemTap,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemTap;

  @override
  Widget build(BuildContext context) {
    final icons = [
      AssetsConstants.home,
      AssetsConstants.shop,
      AssetsConstants.orders,
      AssetsConstants.user,
    ];
    final iconsSelected = [
      AssetsConstants.homeSelected,
      AssetsConstants.shopSelected,
      AssetsConstants.ordersSelected,
      AssetsConstants.userSelected,
    ];

    return Container(
      height: 64,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          final isSelected = index == selectedIndex;
          return BottomBarItem(
            icon: isSelected ? iconsSelected[index] : icons[index],
            isSelected: isSelected,
            onTap: () => onItemTap(index),
          );
        }),
      ),
    );
  }
}
