import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
  Future<ConnectivityResult> get connectionType;
  Future<bool> get isConnectedToWifi;
  Future<bool> get isConnectedToMobile;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {

  NetworkInfoImpl(this.connectivity);

  final Connectivity connectivity;

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return _isConnected(result.firstOrNull);
  }

  @override
  Stream<bool> get onConnectivityChanged {
    return connectivity.onConnectivityChanged.map((result) => _isConnected(result.firstOrNull));
  }

  @override
  Future<ConnectivityResult> get connectionType async {
    final result = await connectivity.checkConnectivity();
    return result.firstOrNull!;
  }

  @override
  Future<bool> get isConnectedToWifi async {
    final result = await connectivity.checkConnectivity();
    return result.firstOrNull == ConnectivityResult.wifi;
  }

  @override
  Future<bool> get isConnectedToMobile async {
    final result = await connectivity.checkConnectivity();
    return result.firstOrNull == ConnectivityResult.mobile;
  }

  bool _isConnected(ConnectivityResult? result) {
    return result != ConnectivityResult.none;
  }
}
