
import 'package:fluttertakehometest/feature/domain/entities/item_entity.dart';
import 'package:fluttertakehometest/feature/domain/repositories/firebase_repository.dart';

class GetItemsUseCase {

  final FirebaseRepository repository;

  GetItemsUseCase({required this.repository});

  Stream<List<ItemEntity>> call(){
    return repository.getItems();
  }
}