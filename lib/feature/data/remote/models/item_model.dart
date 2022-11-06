

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertakehometest/feature/domain/entities/item_entity.dart';
import 'package:fluttertakehometest/feature/domain/entities/note_entity.dart';

class ItemModel extends ItemEntity{
  ItemModel({
    final String? url,
    final String? name,
    final double? price,
  }) :super(
      name: name,
      price: price,
      url: url
  );
  factory ItemModel.fromSnapshot(DocumentSnapshot documentSnapshot){
    return ItemModel(
      name: documentSnapshot.get('name'),
      price: documentSnapshot.get('price'),
      url: documentSnapshot.get('url'),
    );
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
      price: (json['price'] as double).toDouble(),
      url: json['url'],
    );
  }


  Map<String,dynamic> toDocument(){
    return {
      "name":name,
      "price":price,
      "url":url,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "name":name,
      "price":price,
      "url":url,
    };
  }


}