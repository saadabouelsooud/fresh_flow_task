


import 'package:fluttertakehometest/feature/domain/entities/user_entity.dart';
import 'package:fluttertakehometest/feature/domain/repositories/firebase_repository.dart';

class GetCurrentUidUseCase {

  final FirebaseRepository repository;

  GetCurrentUidUseCase({required this.repository});

  Future<String> call()async{
    return repository.getCurrentUId();
  }
}