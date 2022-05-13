import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

//UseCase
class GetTasodifiyTriviaRaqami implements UseCase<TriviaRaqami, NoParams> {
  final TriviaRaqamiRepository repository;

  GetTasodifiyTriviaRaqami({required this.repository});

  @override
  Future<Either<XatoBilan, TriviaRaqami>> call(NoParams params) async {
    return await repository.getTasodifiyTriviaRaqami();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
