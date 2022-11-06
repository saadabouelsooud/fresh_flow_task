part of 'item_cubit.dart';

abstract class ItemState extends Equatable {
  const ItemState();
}

class ItemInitial extends ItemState {
  @override
  List<Object> get props => [];
}

class ItemLoading extends ItemState {
  @override
  List<Object> get props => [];
}

class ItemFailure extends ItemState {
  @override
  List<Object> get props => [];
}

class ItemLoaded extends ItemState {
  final List<ItemEntity> items;

  ItemLoaded({required this.items});

  @override
  List<Object> get props => [items];
}
