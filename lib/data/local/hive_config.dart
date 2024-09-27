import 'dart:io';
import 'package:desafio_dev_mobile_sti3/domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    Hive.registerAdapter(ClientEntityAdapter());
    Hive.registerAdapter(DeliveryAddressEntityAdapter());
    Hive.registerAdapter(ItemEntityAdapter());
    Hive.registerAdapter(PaymentEntityAdapter());
    Hive.registerAdapter(OrderEntityAdapter());
  }
}
