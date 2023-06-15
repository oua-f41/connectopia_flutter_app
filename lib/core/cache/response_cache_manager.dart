import 'package:connectopia/core/cache/base_cache_manager.dart';
import '../../product/models/base_response.dart';

abstract class ResponseCacheManager<T extends BaseResponse>
    extends IBaseCacheService<T> {
  ResponseCacheManager(String key) : super(key);

  @override
  Future<void> putItems(List<T> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }
}
