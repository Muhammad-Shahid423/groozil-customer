import 'package:flutter/material.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        height: 52,
        width: 52,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.white : const Color(0xFFCBD2E0),
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: const Color(0xFF00366B).withOpacity(0.16),
                offset: const Offset(12, 0),
                blurRadius: 30,
              ),
          ],
        ),
        child: AppImage(path: icon, fit: BoxFit.contain),
      ),
    );
  }
}
