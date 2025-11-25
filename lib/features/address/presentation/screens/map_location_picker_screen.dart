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
  LatLng? _selectedLocation;
  bool _isLoading = false;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];
  bool _showSearchResults = false;

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.initialLatitude != null &&
            widget.initialLongitude != null
        ? LatLng(widget.initialLatitude!, widget.initialLongitude!)
        : const LatLng(25.2048, 55.2708); // Dubai default
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
      
      // Get place details for each location
      final results = <Map<String, dynamic>>[];
      for (final location in locations.take(5)) { // Limit to 5 results
        try {
          final placemarks = await placemarkFromCoordinates(
            location.latitude,
            location.longitude,
          );

          
          if (placemarks.isNotEmpty) {
            final placemark = placemarks.first;
            results.add({
              'latitude': location.latitude,
              'longitude': location.longitude,
              'name': placemark.name ?? '',
              'street': placemark.street ?? '',
              'locality': placemark.locality ?? '',
              'subLocality': placemark.subLocality ?? '',
              'administrativeArea': placemark.administrativeArea ?? '',
              'country': placemark.country ?? '',
            });
          }
        } catch (e) {
          debugPrint('Error getting placemark: $e');
        }
      }
      
      setState(() {
        _searchResults = results;
        _showSearchResults = results.isNotEmpty;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error searching location: $e');
      setState(() {
        _searchResults = [];
        _showSearchResults = false;
        _isLoading = false;
      });
    }
  }

  void _selectSearchResult(Map<String, dynamic> result) {
    final newLocation = LatLng(
      result['latitude'] as double,
      result['longitude'] as double,
    );
    setState(() {
      _selectedLocation = newLocation;
      _showSearchResults = false;
      _searchController.clear();
    });

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(newLocation, 15),
    );
  }

  Future<void> _useCurrentLocation() async {
    setState(() => _isLoading = true);

    final position = await MapService.getCurrentLocation();

    if (position != null) {
      final newLocation = LatLng(position.latitude, position.longitude);
      setState(() => _selectedLocation = newLocation);

      await _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(newLocation, 15),
      );
    }

    setState(() => _isLoading = false);
  }

  void _confirmLocation() {
    if (_selectedLocation != null) {
      context.pop({
        'latitude': _selectedLocation!.latitude,
        'longitude': _selectedLocation!.longitude,
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
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
              target: _selectedLocation!,
              zoom: 15,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            onTap: (position) {
              setState(() => _selectedLocation = position);
            },
            markers: _selectedLocation != null
                ? {
                    Marker(
                      markerId: const MarkerId('selected'),
                      position: _selectedLocation!,
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed,
                      ),
                    ),
                  }
                : {},
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),

          // Top App Bar with Search
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
                    constraints: BoxConstraints(maxHeight: 300.h),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final result = _searchResults[index];
                        final name = result['name'] as String? ?? '';
                        final street = result['street'] as String? ?? '';
                        final locality = result['locality'] as String? ?? '';
                        final subLocality = result['subLocality'] as String? ?? '';
                        
                        // Build title (use name or street)
                        final title = name.isNotEmpty ? name : street;
                        
                        // Build subtitle (locality/sublocality)
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

          // Use Current Location Button
          Positioned(
            right: 16.w,
            bottom: 160.h,
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

          // Confirm Location Button
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 40.h,
            child: ElevatedButton(
              onPressed: _confirmLocation,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
              ),
              child: Text(LocaleKeys.address_confirm_location.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
