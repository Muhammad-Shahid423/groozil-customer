import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class SearchField extends StatelessWidget {

  const SearchField({
    super.key,
    this.controller,
    this.hint,
    this.onChanged,
    this.onTap,
    this.onClear,
    this.readOnly = false,
    this.showClearButton = true,
  });

  final TextEditingController? controller;
  final String? hint;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final VoidCallback? onClear;
  final bool readOnly;
  final bool showClearButton;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      style: AppTextStyles.light.regular16_20?.copyWith(
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        hintText: hint ?? context.tr(LocaleKeys.common_search),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.textSecondary,
          size: AppSizes.iconM,
        ),
        suffixIcon: showClearButton && controller != null && controller!.text.isNotEmpty
            ? IconButton(
          icon: Icon(
            Icons.clear,
            color: AppColors.textSecondary,
            size: AppSizes.iconS,
          ),
          onPressed: () {
            controller?.clear();
            onClear?.call();
            onChanged?.call('');
          },
        )
            : null,
        filled: true,
        fillColor: AppColors.backgroundGray,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingL,
          vertical: AppSizes.paddingM,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        hintStyle: AppTextStyles.light.regular14_17?.copyWith(
          color: AppColors.textHint,
        ),
      ),
    );
  }
}
