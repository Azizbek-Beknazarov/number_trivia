import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

@immutable
abstract class TriviaRaqamState extends Equatable {
  @override
  List<Object> get props => [];
}

class Bush extends TriviaRaqamState {}

class Yuklanyapti extends TriviaRaqamState {}

class Yuklandi extends TriviaRaqamState {

  final TriviaRaqami triviaRaqami;

  Yuklandi({required this.triviaRaqami});



  @override
  List<Object> get props => [triviaRaqami];
}

class Error extends TriviaRaqamState {
  final String error;

  Error({required this.error});

  @override
  List<Object> get props => [error];
}
