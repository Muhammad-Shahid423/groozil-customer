import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:groozil_app/core/constants/app_constants.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_image.dart';
import 'package:groozil_app/shared/widgets/canvas/grid_painter.dart';
import 'package:groozil_app/shared/widgets/containers/app_container.dart';

class WalletCard extends StatelessWidget {

  const WalletCard({
    required this.balance,
    required this.lastTopUp,
    required this.onManageWallet,
    super.key,
  });
  final double balance;
  final DateTime lastTopUp;
  final VoidCallback onManageWallet;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [AppColors.primary, AppColors.secondary],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: CustomPaint(
        painter: GridPainter(),
        child: Padding(
          padding: 15.padAll,
          child: Column(
            children: [
              Row(
                children: [
                  AppContainer(
                    color: context.theme.cardColor.withOpacity(0.20),
                    child: const AppImage(path: AssetsConstants.gift),
                  ),
                  8.wBox,
                  Text(
                    'E-Wallet Balance',
                    style: AppTextStyles.light.medium18_24?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              8.hBox,
              Text(
                '${AppConstants.currency} ${balance.toStringAsFixed(2)}',
                style: AppTextStyles.light.semiBold24_30?.copyWith(
                  color: Colors.white,
                ),
              ),
              16.hBox,
              Row(
                children: [
                  Text(
                    'Last Top-up: ',
                    style: AppTextStyles.light.regular14_17?.copyWith(
                      color: const Color(0xffFEF0E6),
                    ),
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(lastTopUp),
                    style: AppTextStyles.light.medium14_17?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: onManageWallet,
                    child: Text(
                      'Manage Wallet',
                      style: AppTextStyles.light.regular14_17?.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
