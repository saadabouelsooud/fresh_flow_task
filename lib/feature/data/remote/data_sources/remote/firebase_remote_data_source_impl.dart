import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertakehometest/feature/data/remote/data_sources/remote/firebase_remote_data_source.dart';
import 'package:fluttertakehometest/feature/data/remote/models/user_model.dart';
import 'package:fluttertakehometest/feature/data/remote/models/item_model.dart';
import 'package:fluttertakehometest/feature/domain/entities/item_entity.dart';
import 'package:fluttertakehometest/feature/domain/entities/note_entity.dart';
import 'package:fluttertakehometest/feature/domain/entities/user_entity.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseRemoteDataSourceImpl({required this.auth, required this.firestore});


  @override
  Future<void> getCreateCurrentUser(UserEntity user) async{
    final userCollectionRef = firestore.collection("users");
    final uid=await getCurrentUId();
    userCollectionRef.doc(uid).get().then((value){
      final newUser=UserModel(
        uid:uid ,
        status: user.status,
        email: user.email,
        name: user.name,
      ).toDocument();
      if (!value.exists){
        userCollectionRef.doc(uid).set(newUser);
      }
      return;
    });

  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid !=null;

  @override
  Future<void> signIn(UserEntity user) async =>
      auth.signInWithEmailAndPassword(email: user.email!, password: user.password!);

  @override
  Future<void> signOut()  async =>
      auth.signOut();

  @override
  Future<void> signUp(UserEntity user) async =>
      auth.createUserWithEmailAndPassword(email: user.email!, password: user.password!);


  @override
  Stream<List<ItemEntity>> getItems() {
    final itemCollectionRef=firestore.collection("items");

    return itemCollectionRef.snapshots().map((querySnap) {
      return querySnap.docs.map((docSnap) => ItemModel.fromSnapshot(docSnap)).toList();
    });
  }
}
