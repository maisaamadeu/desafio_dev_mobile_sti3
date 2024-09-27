import 'package:desafio_dev_mobile_sti3/core/network/network.dart';
import 'package:desafio_dev_mobile_sti3/di/dependency_injection.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initDependecies() {
  getIt.registerLazySingleton<NetworkInfoRepository>(
    () => NetworkInfoRepositoryImpl(),
  );
  getIt.registerLazySingleton(
    () => ServerApiClient(
      networkInfoRepository: getIt(),
    ),
  );
}

Future<void> initFeaturesDependecies() async {
  await initOrders();
}
