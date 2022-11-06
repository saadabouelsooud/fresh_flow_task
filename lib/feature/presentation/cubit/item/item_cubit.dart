import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertakehometest/feature/domain/entities/item_entity.dart';
import 'package:fluttertakehometest/feature/domain/use_cases/get_items_usecase.dart';
import 'package:fluttertakehometest/feature/domain/entities/item_entity.dart';


part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  final GetItemsUseCase getItemsUseCase;
  ItemCubit({required this.getItemsUseCase}) : super(ItemInitial());


  Future<void> getItems()async{
    emit(ItemLoading());
    try{
      getItemsUseCase.call().listen((items) {
        emit(ItemLoaded(items: items));
      });
    }on SocketException catch(_){
      emit(ItemFailure());
    }catch(_){
      emit(ItemFailure());
    }
  }

}
