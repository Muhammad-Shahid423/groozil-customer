import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:groozil_app/core/services/map_service.dart';
import 'package:groozil_app/generated/locale_keys.g.dart';
import 'package:groozil_app/shared/theme/app_colors.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/theme/app_text_styles.dart';

class MapLocationPickerScreen extends StatefulWidget {
  const MapLocationPickerScreen({
    this.initialLatitude,
    this.initialLongitude,
    super.key,
  });

  final double? initialLatitude;
  final double? initialLongitude;

  @override
  State<MapLocationPickerScreen> createState() =>
      _MapLocationPickerScreenState();
}

class _MapLocationPickerScreenState extends State<MapLocationPickerScreen> {
  GoogleMapController? _mapController;
  LatLng _center = const LatLng(25.2048, 55.2708); // Dubai default
  bool _isLoading = false;
  bool _isUpdatingAddress = false;

  // Address display
  String _addressTitle = '';
  String _addressSubtitle = '';

  // Search
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];
  bool _showSearchResults = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialLatitude != null && widget.initialLongitude != null) {
      _center = LatLng(widget.initialLatitude!, widget.initialLongitude!);
    }
    // Load initial address
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateAddressFromCenter();
    });
  }

  Future<void> _updateAddressFromCenter() async {
    if (_isUpdatingAddress) return;
    
    setState(() => _isUpdatingAddress = true);

    try {
      final result = await MapService.getAddressFromCoordinates(
        _center.latitude,
        _center.longitude,
      );

      if (mounted) {
        setState(() {
          _addressTitle = result['street']?.isNotEmpty == true
              ? result['street']!
              : result['district'] ?? 'Unknown Location';
          _addressSubtitle = [
            result['district'],
            result['city'],
          ].where((s) => s?.isNotEmpty == true).join(', ');
        });
      }
    } catch (e) {
      debugPrint('Error updating address: $e');
    } finally {
      if (mounted) {
        setState(() => _isUpdatingAddress = false);
      }
    }
  }

  Future<void> _searchLocation(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _showSearchResults = false;
      });
      return;
    }

    try {
      setState(() => _isLoading = true);

      final locations = await locationFromAddress(query);

      final results = <Map<String, dynamic>>[];
      for (final location in locations.take(5)) {
        try {
          final placemarks = await placemarkFromCoordinates(
            location.latitude,
            location.longitude,
          );

          if (placemarks.isNotEmpty) {
            final place = placemarks.first;
            results.add({
              'latitude': location.latitude,
              'longitude': location.longitude,
              'name': place.name ?? '',
              'street': place.street ?? '',
              'locality': place.locality ?? '',
              'subLocality': place.subLocality ?? '',
              'administrativeArea': place.administrativeArea ?? '',
              'country': place.country ?? '',
            });
          }
        } catch (e) {
          debugPrint('Error getting placemark: $e');
        }
      }

      if (mounted) {
        setState(() {
          _searchResults = results;
          _showSearchResults = results.isNotEmpty;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error searching location: $e');
      if (mounted) {
        setState(() {
          _searchResults = [];
          _showSearchResults = false;
          _isLoading = false;
        });
      }
    }
  }

  void _selectSearchResult(Map<String, dynamic> result) {
    final newLocation = LatLng(
      result['latitude'] as double,
      result['longitude'] as double,
    );

    setState(() {
      _center = newLocation;
      _showSearchResults = false;
      _searchController.clear();
    });

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(newLocation, 15),
    );

    _updateAddressFromCenter();
  }

  Future<void> _useCurrentLocation() async {
    setState(() => _isLoading = true);

    final position = await MapService.getCurrentLocation();

    if (position != null) {
      final newLocation = LatLng(position.latitude, position.longitude);
      setState(() => _center = newLocation);

      await _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(newLocation, 15),
      );

      await _updateAddressFromCenter();
    } else {
      // Show error message if location is not available
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              LocaleKeys.address_failed_to_get_location.tr(),
            ),
            backgroundColor: AppColors.error,
            action: SnackBarAction(
              label: LocaleKeys.common_ok.tr(),
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );
      }
    }

    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  void _confirmLocation() {
    final fullAddress = [_addressTitle, _addressSubtitle]
        .where((s) => s.isNotEmpty)
        .join(', ');

    context.pop({
      'latitude': _center.latitude,
      'longitude': _center.longitude,
      'shortAddress': _addressTitle,
      'fullAddress': fullAddress,
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            onCameraMove: (position) {
              setState(() => _center = position.target);
            },
            onCameraIdle: _updateAddressFromCenter,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
          ),

          // Center pin indicator
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 40.h),
              child: Icon(
                Icons.location_on,
                size: 48.sp,
                color: AppColors.primary,
              ),
            ),
          ),

          // Top Search Bar
          SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.address_search_location.tr(),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                          ),
                          onChanged: _searchLocation,
                        ),
                      ),
                      if (_searchController.text.isNotEmpty)
                        IconButton(
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchResults = [];
                              _showSearchResults = false;
                            });
                          },
                          icon: const Icon(Icons.clear),
                        ),
                    ],
                  ),
                ),

                // Search Results
                if (_showSearchResults && _searchResults.isNotEmpty)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    constraints: BoxConstraints(maxHeight: 300.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final result = _searchResults[index];
                        final name = result['name'] as String? ?? '';
                        final street = result['street'] as String? ?? '';
                        final locality = result['locality'] as String? ?? '';
                        final subLocality =
                            result['subLocality'] as String? ?? '';

                        final title = name.isNotEmpty ? name : street;
                        final subtitle = [subLocality, locality]
                            .where((s) => s.isNotEmpty)
                            .join(', ');

                        return ListTile(
                          leading: const Icon(
                            Icons.location_on,
                            color: AppColors.primary,
                          ),
                          title: Text(
                            title.isNotEmpty ? title : 'Unknown Location',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: subtitle.isNotEmpty
                              ? Text(
                                  subtitle,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : null,
                          onTap: () => _selectSearchResult(result),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),

          // Use Current Location FAB
          Positioned(
            right: 16.w,
            bottom: 200.h,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _isLoading ? null : _useCurrentLocation,
              child: _isLoading
                  ? SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(
                      Icons.my_location,
                      color: AppColors.primary,
                    ),
            ),
          ),

          // Bottom Address Card
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSizes.radiusXL),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                                if (_isUpdatingAddress)
                                  SizedBox(
                                    width: 16.w,
                                    height: 16.h,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                else ...[
                                  Text(
                                    _addressTitle.isNotEmpty
                                        ? _addressTitle
                                        : 'Loading...',
                                    style: AppTextStyles.light.semiBold14_17
                                        ?.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  if (_addressSubtitle.isNotEmpty) ...[
                                    SizedBox(height: 4.h),
                                    Text(
                                      _addressSubtitle,
                                      style: AppTextStyles.light.regular12_15
                                          ?.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                        onPressed: _isUpdatingAddress ? null : _confirmLocation,
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
                        child: Text(LocaleKeys.address_confirm_location.tr()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
