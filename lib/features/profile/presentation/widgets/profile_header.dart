import 'package:flutter/material.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';

class ProfileHeader extends StatelessWidget {

  const ProfileHeader({
    required this.fullName,
    required this.email,
    required this.onEditPressed,
    super.key,
  });
  final String fullName;
  final String email;
  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(
          path: AssetsConstants.placeholder,
          height: 50,
          width: 50,
          borderRadius: 10.rBox,
        ),
        16.wBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                style: AppTextStyles.light.medium16_20,
              ),
              Text(
                email,
                style: AppTextStyles.light.regular14_17?.copyWith(
                  color: context.theme.shadowColor,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onEditPressed,
          child: Padding(
            padding: 12.padB,
            child: Row(
              children: [
                const AppImage(path: AssetsConstants.edit),
                4.wBox,
                Text(
                  'Edit Profile',
                  style: AppTextStyles.light.regular14_17?.copyWith(
                    color: context.theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
