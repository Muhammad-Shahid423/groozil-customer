import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:groozil_app/core/extensions/spacing_extensions.dart';
import 'package:groozil_app/core/routing/navigation_service.dart';
import 'package:groozil_app/core/services/map_service.dart';
import 'package:groozil_app/features/address/domain/entities/address.dart';
import 'package:groozil_app/features/address/domain/repositories/address_repository.dart';
import 'package:groozil_app/features/address/presentation/providers/address_notifier.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';
import 'package:groozil_app/shared/widgets/app_bar/custom_app_bar.dart';

class AddEditAddressScreen extends ConsumerStatefulWidget {
  const AddEditAddressScreen({
    this.addressId,
    this.address,
    this.latitude,
    this.longitude,
    this.shortAddress,
    this.fullAddress,
    super.key,
  });

  final String? addressId;
  final Address? address;
  final double? latitude;
  final double? longitude;
  final String? shortAddress;
  final String? fullAddress;

  @override
  ConsumerState<AddEditAddressScreen> createState() =>
      _AddEditAddressScreenState();
}

class _AddEditAddressScreenState extends ConsumerState<AddEditAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _labelController = TextEditingController();
  final _streetController = TextEditingController();
  final _districtController = TextEditingController();
  final _cityController = TextEditingController();
  final _buildingController = TextEditingController();
  final _floorController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _additionalDetailsController = TextEditingController();

  // Map
  GoogleMapController? _mapController;
  double _latitude = 25.2048;
  double _longitude = 55.2708;

  // Form state
  String _selectedLabel = 'Home';
  bool _isDefault = false;
  bool _isLoading = false;
  bool _isSaving = false;

  // Display address
  String _displayTitle = '';
  String _displaySubtitle = '';

  final List<String> _labelOptions = ['Home', 'Work', 'Office', 'Hotel', 'Other'];

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  Future<void> _initializeForm() async {
    setState(() => _isLoading = true);

    if (widget.address != null) {
      // Edit mode - populate from existing address
      final address = widget.address!;

      setState(() {
        _selectedLabel = address.label;
        _streetController.text = address.street;
        _districtController.text = address.district;
        _cityController.text = address.city;
        _buildingController.text = address.building;
        _floorController.text = address.floor;
        _apartmentController.text = address.apartment;
        _additionalDetailsController.text = address.additionalDetails;
        _latitude = address.latitude;
        _longitude = address.longitude;
        _isDefault = address.isDefault;
        _displayTitle = address.street.isNotEmpty
            ? address.street
            : address.district;
        _displaySubtitle = [address.district, address.city]
            .where((s) => s.isNotEmpty)
            .join(', ');
      });

      await _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(_latitude, _longitude), 15),
      );
    } else if (widget.latitude != null && widget.longitude != null) {
      // Coming from map picker
      setState(() {
        _latitude = widget.latitude!;
        _longitude = widget.longitude!;
        _displayTitle = widget.shortAddress ?? '';
        _displaySubtitle = widget.fullAddress ?? '';
      });

      // Try to parse the address info
      if (widget.fullAddress != null && widget.fullAddress!.isNotEmpty) {
        await _parseFullAddress(widget.fullAddress!);
      } else {
        await _updateAddressFromCoordinates(_latitude, _longitude);
      }

      await _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(_latitude, _longitude), 15),
      );
    } else {
      // New address - use current location
      await _loadCurrentLocation();
    }

    setState(() => _isLoading = false);
  }

  Future<void> _parseFullAddress(String fullAddress) async {
    // Try to extract street, district, city from fullAddress
    final parts = fullAddress.split(',').map((s) => s.trim()).toList();
    
    if (parts.isNotEmpty) {
      _streetController.text = parts.first;
      if (parts.length > 1) {
        _districtController.text = parts[1];
      }
      if (parts.length > 2) {
        _cityController.text = parts[2];
      }
    }
  }

  Future<void> _loadCurrentLocation() async {
    setState(() => _isLoading = true);

    final position = await MapService.getCurrentLocation();

    if (position != null) {
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
      });

      await _updateAddressFromCoordinates(_latitude, _longitude);

      await _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(_latitude, _longitude), 15),
      );
    }

    setState(() => _isLoading = false);
  }

  Future<void> _updateAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    final address = await MapService.getAddressFromCoordinates(
      latitude,
      longitude,
    );

    setState(() {
      _streetController.text = address['street'] ?? '';
      _districtController.text = address['district'] ?? '';
      _cityController.text = address['city'] ?? '';
      _displayTitle = address['street']?.isNotEmpty == true
          ? address['street']!
          : address['district'] ?? '';
      _displaySubtitle = [address['district'], address['city']]
          .where((s) => s?.isNotEmpty == true)
          .join(', ');
    });
  }

  Future<void> _openMapPicker() async {
    final result = await NavigationService.goToSelectLocation(
      _latitude,
      _longitude,
    );

    if (result != null && mounted) {
      final lat = result['latitude'] as double?;
      final lng = result['longitude'] as double?;
      final shortAddr = result['shortAddress'] as String?;
      final fullAddr = result['fullAddress'] as String?;

      if (lat != null && lng != null) {
        setState(() {
          _latitude = lat;
          _longitude = lng;
          _displayTitle = shortAddr ?? '';
          _displaySubtitle = fullAddr ?? '';
        });

        if (fullAddr != null && fullAddr.isNotEmpty) {
          await _parseFullAddress(fullAddr);
        } else {
          await _updateAddressFromCoordinates(lat, lng);
        }

        await _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(LatLng(lat, lng), 15),
        );
      }
    }
  }

  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSaving = true);

    final params = AddressParams(
      label: _selectedLabel,
      street: _streetController.text.trim(),
      district: _districtController.text.trim(),
      city: _cityController.text.trim(),
      building: _buildingController.text.trim(),
      apartment: _apartmentController.text.trim(),
      floor: _floorController.text.trim(),
      latitude: _latitude,
      longitude: _longitude,
      additionalDetails: _additionalDetailsController.text.trim(),
      isDefault: _isDefault,
    );

    bool success;
    if (widget.address != null) {
      // Edit mode - update existing address
      success = await ref
          .read(addressProvider.notifier)
          .updateAddress(widget.address!.id, params);
    } else {
      // Add mode - create new address
      success = await ref.read(addressProvider.notifier).addAddress(params);
    }

    setState(() => _isSaving = false);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.address != null
                ? 'Address updated successfully'
                : 'Address saved successfully',
          ),
        ),
      );
      context.pop();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.address != null
                ? 'Failed to update address'
                : 'Failed to save address',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: CustomAppBar(
        title: widget.addressId != null 
            ? LocaleKeys.address_edit_address.tr() 
            : LocaleKeys.address_add_address.tr(),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Location Summary Card
                  Container(
                    color: Colors.white,
                    padding: AppSizes.paddingL.padAll,
                    child: Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.location_on,
                            color: AppColors.primary,
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _displayTitle.isNotEmpty
                                    ? _displayTitle
                                    : LocaleKeys.address_location.tr(),
                                style:
                                    AppTextStyles.light.semiBold14_17?.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (_displaySubtitle.isNotEmpty) ...[
                                SizedBox(height: 4.h),
                                Text(
                                  _displaySubtitle,
                                  style:
                                      AppTextStyles.light.regular12_15?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: _openMapPicker,
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primary,
                          ),
                          child: Text(
                            'Change',
                            style: AppTextStyles.light.semiBold14_17?.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // Form
                  Container(
                    color: Colors.white,
                    padding: AppSizes.paddingL.padAll,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Label Dropdown
                          Text(
                            LocaleKeys.address_label.tr(),
                            style: AppTextStyles.light.semiBold14_17?.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: AppSizes.spaceS),
                          DropdownButtonFormField<String>(
                            initialValue: _selectedLabel,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSizes.radiusM),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                            ),
                            items: _labelOptions.map((label) {
                              return DropdownMenuItem(
                                value: label,
                                child: Text(label),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() => _selectedLabel = value);
                              }
                            },
                          ),

                          SizedBox(height: AppSizes.spaceM),

                          // Street
                          _buildTextField(
                            label: LocaleKeys.address_street.tr(),
                            controller: _streetController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return LocaleKeys.validation_required.tr();
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: AppSizes.spaceM),

                          // District
                          _buildTextField(
                            label: LocaleKeys.address_district.tr(),
                            controller: _districtController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return LocaleKeys.validation_required.tr();
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: AppSizes.spaceM),

                          // City
                          _buildTextField(
                            label: LocaleKeys.address_city.tr(),
                            controller: _cityController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return LocaleKeys.validation_required.tr();
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: AppSizes.spaceM),

                          // Building
                          _buildTextField(
                            label: LocaleKeys.address_building.tr(),
                            controller: _buildingController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return LocaleKeys.validation_required.tr();
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: AppSizes.spaceM),

                          // Floor & Apartment in row
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                  label: LocaleKeys.address_floor.tr(),
                                  controller: _floorController,
                                ),
                              ),
                              SizedBox(width: AppSizes.spaceM),
                              Expanded(
                                child: _buildTextField(
                                  label: LocaleKeys.address_apartment.tr(),
                                  controller: _apartmentController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return LocaleKeys.validation_required.tr();
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: AppSizes.spaceM),

                          // Additional Details
                          _buildTextField(
                            label: '${LocaleKeys.address_additional_details.tr()} (Optional)',
                            controller: _additionalDetailsController,
                            maxLines: 3,
                          ),

                          SizedBox(height: AppSizes.spaceM),

                          // Set as Default
                          Row(
                            children: [
                              Checkbox(
                                value: _isDefault,
                                onChanged: (value) {
                                  setState(() => _isDefault = value ?? false);
                                },
                                activeColor: AppColors.primary,
                              ),
                              Text(
                                LocaleKeys.address_set_as_default.tr(),
                                style:
                                    AppTextStyles.light.regular14_17?.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: AppSizes.spaceL),

                          // Save Button
                          ElevatedButton(
                            onPressed: _isSaving ? null : _saveAddress,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              minimumSize: Size(double.infinity, 50.h),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSizes.radiusM),
                              ),
                            ),
                            child: _isSaving
                                ? SizedBox(
                                    width: 20.w,
                                    height: 20.h,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    widget.address != null
                                        ? LocaleKeys.address_update_address.tr()
                                        : LocaleKeys.address_save_address.tr(),
                                  ),
                          ),

                          SizedBox(height: AppSizes.spaceXL),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.light.semiBold14_17?.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSizes.spaceS),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _labelController.dispose();
    _streetController.dispose();
    _districtController.dispose();
    _cityController.dispose();
    _buildingController.dispose();
    _floorController.dispose();
    _apartmentController.dispose();
    _additionalDetailsController.dispose();
    super.dispose();
  }
}
