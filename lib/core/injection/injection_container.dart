import 'package:desafio_dev_mobile_sti3/core/network/network.dart';
import 'package:desafio_dev_mobile_sti3/di/dependency_injection.dart';
import 'package:get/get.dart';

void initDependecies() {
  Get.lazyPut<NetworkInfoRepository>(
    () => NetworkInfoRepositoryImpl(),
  );
  Get.lazyPut<ServerApiClient>(
    () => ServerApiClient(
      networkInfoRepository: Get.find(),
    ),
  );
}

Future<void> initFeaturesDependecies() async {
  await initOrders();
}
