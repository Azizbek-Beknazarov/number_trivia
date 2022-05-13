import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/number_trivia_repository.dart';

typedef _AniqOrTasodifiyChooser = Future<TriviaRaqamiModel> Function();

class TriviaRaqamiRepositoryImpl implements TriviaRaqamiRepository {
  final TriviaRaqamiRDS remoteDataSource;
  final TriviaRaqamiLDS localDataSource;
  final NetworkInfo networkInfo;

  TriviaRaqamiRepositoryImpl(
      {
        required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

//
  @override
  Future<Either<XatoBilan, TriviaRaqami>> getAniqTriviaRaqami(int raqam) async {
    return await _getTriviaFunction(() {
      return remoteDataSource.getAniqTriviaRaqami(raqam);
    });
  }

  @override
  Future<Either<XatoBilan, TriviaRaqami>> getTasodifiyTriviaRaqami() async {
    return await _getTriviaFunction(() {
      return remoteDataSource.getTasodifiyTriviaRaqami();
    });
  }

  Future<Either<XatoBilan, TriviaRaqami>> _getTriviaFunction(
      _AniqOrTasodifiyChooser getAniqOrTasodif) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRaqam = await getAniqOrTasodif();
        localDataSource.cacheTRaqami(remoteRaqam);
        return Right(remoteRaqam);
      } on ServerException {
        return Left(ServerXato());
      }
    } else {
      try {
        final localRaqam = await localDataSource.getOxirgiTRaqami();
        return Right(localRaqam);
      } on CacheException {
        return Left(CacheXato());
      }
    }
  }
}
