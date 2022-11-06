import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertakehometest/feature/domain/use_cases/get_items_usecase.dart';
import 'package:fluttertakehometest/feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:fluttertakehometest/feature/data/remote/data_sources/remote/firebase_remote_data_source_impl.dart';
import 'package:fluttertakehometest/feature/data/repositories/firebase_repository_impl.dart';
import 'package:fluttertakehometest/feature/domain/repositories/firebase_repository.dart';
import 'package:fluttertakehometest/feature/domain/use_cases/get_create_current_user_usecase.dart';
import 'package:fluttertakehometest/feature/domain/use_cases/get_current_uid_usecase.dart';
import 'package:fluttertakehometest/feature/domain/use_cases/is_sign_in_usecase.dart';
import 'package:fluttertakehometest/feature/domain/use_cases/sign_in_usecase.dart';
import 'package:fluttertakehometest/feature/domain/use_cases/sign_out_usecase.dart';
import 'package:fluttertakehometest/feature/presentation/cubit/user/user_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/data/remote/data_sources/local/firbase_local_data_source.dart';
import 'feature/data/remote/data_sources/local/firebase_local_data_source_impl.dart';
import 'feature/data/remote/data_sources/remote/firebase_remote_data_source.dart';
import 'feature/presentation/cubit/item/item_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Cubit/Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call(),
      getCurrentUidUseCase: sl.call()));
  sl.registerFactory<UserCubit>(() => UserCubit(
        getCreateCurrentUserUseCase: sl.call(),
        signInUseCase: sl.call(),
      ));
  sl.registerFactory<ItemCubit>(() => ItemCubit(
    getItemsUseCase: sl.call()
  ));

  //useCase
  sl.registerLazySingleton<GetCreateCurrentUserUsecase>(
      () => GetCreateCurrentUserUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetItemsUseCase>(
          () => GetItemsUseCase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call(),localDataSource: sl.call()));

  //data source
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(auth: sl.call(), firestore: sl.call()));

  sl.registerLazySingleton<FirebaseItemsLocalDataSource>(
        () => FirebaseItemsLocalDataSourceImpl(sharedPreferences: sl.call()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
