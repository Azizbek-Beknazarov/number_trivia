import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
//UseCase
class GetAniqTriviaRaqami implements UseCase<TriviaRaqami, TriviaParams> {
  final TriviaRaqamiRepository repository;

  GetAniqTriviaRaqami({required this.repository});

  @override
  Future<Either<XatoBilan, TriviaRaqami>> call(TriviaParams params) async {
    return await repository.getAniqTriviaRaqami(params.raqam);
  }
}

class TriviaParams extends Equatable {
  final int raqam;

  TriviaParams({required this.raqam});

  @override
  List<Object> get props => [raqam];
}
