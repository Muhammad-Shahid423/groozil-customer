import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapService {
  /// Get current location
  static Future<Position?> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint('❌ Location services are disabled');
        return null;
      }

      // Request location permission
      final permission = await requestLocationPermission();
      if (!permission) {
        debugPrint('❌ Location permission denied');
        return null;
      }

      // Get current position
      debugPrint('📍 Getting current location...');
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      debugPrint('✅ Got location: ${position.latitude}, ${position.longitude}');
      return position;
    } on Exception catch (e) {
      debugPrint('🔴 Error getting current location: $e');
      return null;
    }
  }

  /// Request location permission
  static Future<bool> requestLocationPermission() async {
    try {
      var status = await Permission.location.status;
      
      if (status.isDenied) {
        debugPrint('🔐 Requesting location permission...');
        status = await Permission.location.request();
      }
      
      final granted = status.isGranted || status.isLimited;
      debugPrint(granted ? '✅ Location permission granted' : '❌ Location permission denied');
      
      return granted;
    } on Exception catch (e) {
      debugPrint('🔴 Error requesting location permission: $e');
      return false;
    }
  }

  /// Get address from coordinates (reverse geocoding)
  static Future<Map<String, String>> getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      debugPrint('🔍 Reverse geocoding: $latitude, $longitude');
      
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      
      if (placemarks.isEmpty) {
        debugPrint('⚠️ No placemarks found');
        return {
          'street': '',
          'district': '',
          'city': '',
        };
      }

      final place = placemarks.first;
      
      final result = {
        'street': place.street ?? '',
        'district': place.subLocality ?? place.locality ?? '',
        'city': place.locality ?? place.administrativeArea ?? '',
      };
      
      debugPrint('✅ Address found: $result');
      return result;
    } on Exception catch (e) {
      debugPrint('🔴 Error getting address from coordinates: $e');
      return {
        'street': '',
        'district': '',
        'city': '',
      };
    }
  }
}
