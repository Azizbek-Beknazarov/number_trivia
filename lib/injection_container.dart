import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:number_trivia/core/util/input_converter.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

// Service Locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia

  // Bloc
  sl.registerFactory(() => TriviaRaqamBloc(
      getAniqTriviaRaqamiUSE: sl(),
      getTasodifiyTriviaRaqamiUSE: sl(),
      inputConverter: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetAniqTriviaRaqami(repository: sl()));
  sl.registerLazySingleton(() => GetTasodifiyTriviaRaqami(repository: sl()));

  // Repository
  sl.registerLazySingleton<TriviaRaqamiRepository>(() =>
      TriviaRaqamiRepositoryImpl(
          remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));


  // Data sources
  sl.registerLazySingleton<TriviaRaqamiLDS>(() => TriviaRaqamiLDSImple(preferences: sl()));
  sl.registerLazySingleton<TriviaRaqamiRDS>(() => TriviaRaqamiRDSImple(client: sl()));


  //! Core
sl.registerLazySingleton(() => InputConverter());


  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
