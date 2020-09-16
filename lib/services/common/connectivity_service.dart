import 'dart:async';

import 'package:connectivity/connectivity.dart';

enum ConnectivityStatus { WiFi, Cellular, Offline }

class ConnectivityService {
  //Create on private controller
  StreamController<ConnectivityStatus> _connectionStatusController =
      StreamController<ConnectivityStatus>();

  Stream<ConnectivityStatus> get connectivityStream =>
      _connectionStatusController.stream;

  ConnectivityService() {
    //Subscribe to the Connectivity Change Stream
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatusController.add(_getConnectivityStatusFromResult(result));
    });
  }

  //Convert the third party Connectivity Status Enum to our own Enum
  ConnectivityStatus _getConnectivityStatusFromResult(
      ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}
