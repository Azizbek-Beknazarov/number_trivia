import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

abstract class TriviaRaqamiRepository {
  Future<Either<XatoBilan, TriviaRaqami>> getAniqTriviaRaqami(int raqam);

  Future<Either<XatoBilan, TriviaRaqami>> getTasodifiyTriviaRaqami();
}
