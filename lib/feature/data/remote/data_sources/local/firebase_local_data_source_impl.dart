import 'dart:convert';

import 'package:fluttertakehometest/feature/data/remote/data_sources/local/firbase_local_data_source.dart';
import 'package:fluttertakehometest/feature/data/remote/models/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseItemsLocalDataSourceImpl implements FirebaseItemsLocalDataSource {
  final SharedPreferences? sharedPreferences;

  FirebaseItemsLocalDataSourceImpl({this.sharedPreferences});

  @override
  Future<ItemModel> getItem(String name) {
    final jsonString = sharedPreferences!.getString(name);
    if (jsonString != null) {
      return Future.value(ItemModel.fromJson(json.decode(jsonString)));
    } else {
      throw Error();
    }
  }

  @override
  Future<void> cacheItem(ItemModel itemToCache) {

    return sharedPreferences!.setString(
      itemToCache.name!,
      json.encode(itemToCache.toJson()),
    );
  }
}