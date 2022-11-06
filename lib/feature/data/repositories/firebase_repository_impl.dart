

import 'package:fluttertakehometest/feature/data/remote/data_sources/local/firbase_local_data_source.dart';
import 'package:fluttertakehometest/feature/data/remote/data_sources/remote/firebase_remote_data_source.dart';
import 'package:fluttertakehometest/feature/domain/entities/item_entity.dart';
import 'package:fluttertakehometest/feature/domain/entities/note_entity.dart';
import 'package:fluttertakehometest/feature/domain/entities/user_entity.dart';
import 'package:fluttertakehometest/feature/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl extends FirebaseRepository{
  final FirebaseRemoteDataSource remoteDataSource;
  final FirebaseItemsLocalDataSource localDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUId() async =>
      remoteDataSource.getCurrentUId();

  @override
  Future<bool> isSignIn() async =>
      remoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async =>
      remoteDataSource.signIn(user);

  @override
  Future<void> signOut() async =>
      remoteDataSource.signOut();

  @override
  Stream<List<ItemEntity>> getItems() =>
    remoteDataSource.getItems();

}