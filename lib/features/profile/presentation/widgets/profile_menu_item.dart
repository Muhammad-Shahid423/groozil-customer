import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    required this.title,
    required this.asset,
    required this.onTap,
    super.key,
  });
  final String title;
  final String asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          AppImage(path: asset, height: 24.h, width: 24.w, fit: BoxFit.contain),
          10.wBox,
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.light.regular16_20
            ),
          ),
          const AppImage(path: AssetsConstants.caretForward, height: 14),
        ],
      ),
    );
  }
}
