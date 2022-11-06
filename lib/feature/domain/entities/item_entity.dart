import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String? name;
  final double? price;
  final String? url;

  ItemEntity({this.name, this.price, this.url});

  @override
  // TODO: implement props
  List<Object?> get props => [name,price,url];
}