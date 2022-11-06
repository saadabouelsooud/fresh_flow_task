
import 'package:fluttertakehometest/feature/domain/entities/item_entity.dart';
import 'package:fluttertakehometest/feature/domain/entities/user_entity.dart';

abstract class FirebaseRemoteDataSource{
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);

  Stream<List<ItemEntity>> getItems();
}
