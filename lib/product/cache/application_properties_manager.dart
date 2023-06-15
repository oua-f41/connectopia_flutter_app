import 'package:connectopia/core/cache/base_cache_manager.dart';
import 'package:connectopia/product/cache/cache_enums.dart';
import 'package:hive/hive.dart';

import '../constants/hive_constants.dart';
import 'application_properties.dart';

class ApplicationPropertiesManager
    extends IBaseCacheService<ApplicationProperties> {
  ApplicationPropertiesManager() : super(CacheEnums.applicationProperties.name);

  @override
  Future<void> putItems(List<ApplicationProperties> items) {
    // TODO: implement putItems
    throw UnimplementedError();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.applicationPropertiesHiveId)) {
      Hive.registerAdapter(ApplicationPropertiesAdapter());
    }
  }
}
