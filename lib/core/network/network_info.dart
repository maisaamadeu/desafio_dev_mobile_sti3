import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoRepository {
  Future<bool> get hasConnection;
}

class NetworkInfoRepositoryImpl extends NetworkInfoRepository {
  @override
  Future<bool> get hasConnection async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
