

import 'package:fluttertakehometest/feature/data/remote/models/item_model.dart';

abstract class FirebaseItemsLocalDataSource {
  Future<ItemModel> getItem(String name);

  Future<void> cacheItem(ItemModel item);
}