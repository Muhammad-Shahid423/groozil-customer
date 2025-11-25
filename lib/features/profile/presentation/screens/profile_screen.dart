import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/core/extensions/context_extensions.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:groozil_app/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:groozil_app/features/profile/presentation/widgets/wallet_card.dart';
import 'package:groozil_app/shared/widgets/app_bar/custom_app_bar.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const CustomAppBar(title: 'My Profile', showBackButton: false),
        Expanded(
          child: Container(
            padding: 20.padAll,
            decoration: BoxDecoration(
              color: context.theme.cardColor.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            child: ListView(
              padding: 0.padAll,
              physics: const ClampingScrollPhysics(),
              children: [
                ProfileHeader(
                  fullName: 'John Doe',
                  email: 'john.doe@gmail.com',
                  onEditPressed: () {},
                ),
                24.hBox,
                WalletCard(
                  balance: 100,
                  lastTopUp: DateTime.now(),
                  onManageWallet: () {},
                ),
                32.hBox,
                const ProfileMenuItem(
                  title: 'My Wishlist',
                  asset: AssetsConstants.heart,
                  onTap: NavigationService.goToWishlist,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
