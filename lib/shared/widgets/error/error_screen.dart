import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';

class ErrorScreen extends StatelessWidget {

  const ErrorScreen({
    required this.error, super.key,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 80.sp,
                color: AppColors.error,
              ),
              SizedBox(height: 24.h),
              Text(
                'Oops! Something went wrong',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                error,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              const ElevatedButton(
                onPressed: NavigationService.goToHome,
                child: Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
