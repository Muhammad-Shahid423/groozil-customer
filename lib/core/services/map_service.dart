import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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

      // Check and request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      
      if (permission == LocationPermission.denied) {
        debugPrint('🔐 Requesting location permission...');
        permission = await Geolocator.requestPermission();
        
        if (permission == LocationPermission.denied) {
          debugPrint('❌ Location permission denied');
          return null;
        }
      }
      
      if (permission == LocationPermission.deniedForever) {
        debugPrint('❌ Location permissions are permanently denied');
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

  /// Check if location permission is granted
  static Future<bool> hasLocationPermission() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return false;
      }

      final permission = await Geolocator.checkPermission();
      return permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse;
    } on Exception catch (e) {
      debugPrint('🔴 Error checking location permission: $e');
      return false;
    }
  }

  /// Open app settings to allow user to grant location permission
  static Future<bool> openLocationSettings() async {
    try {
      return await Geolocator.openLocationSettings();
    } on Exception catch (e) {
      debugPrint('🔴 Error opening location settings: $e');
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
