import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:number_trivia/core/error/failures.dart';

import '../../domain/entities/number_trivia.dart';
import '../../domain/usecases/get_concrete_number_trivia.dart';
import '../../domain/usecases/get_random_number_trivia.dart';
import './bloc.dart';
import '../../../../core/util/input_converter.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class TriviaRaqamBloc extends Bloc<TriviaRaqamiEvent, TriviaRaqamState> {
  final GetAniqTriviaRaqami getAniqTriviaRaqamiUSE;
  final GetTasodifiyTriviaRaqami getTasodifiyTriviaRaqamiUSE;
  final InputConverter inputConverter;

  //
  TriviaRaqamBloc(
      {required this.getAniqTriviaRaqamiUSE,
      required this.getTasodifiyTriviaRaqamiUSE,
      required this.inputConverter})
      : super(Bush()) {
    //
    on<GetTriviRaqamAniq>((event, emit) async {
      final Either inputEither =
          inputConverter.stringToUnsignedInteger(event.raqamString);
      await inputEither.fold(
        (failure) async => emit(Error(error: failure)),
        (integer) async {
          emit(Yuklanyapti());
          final failureOrTrivia =
              await getAniqTriviaRaqamiUSE(TriviaParams(raqam: integer));
          _eitherLoadedOrFailure(failureOrTrivia, emit);
        },
      );
    });

    //
    on<GetTriviaRaqamTasodif>((event, emit) async {
      emit(Yuklanyapti());
      final failureOrTrivia = await getTasodifiyTriviaRaqamiUSE(NoParams());
      _eitherLoadedOrFailure(failureOrTrivia, emit);
    });
  }
}
//

//
void _eitherLoadedOrFailure(Either<XatoBilan, TriviaRaqami> failureOrTrivia,
    Emitter<TriviaRaqamState> emit) {
  failureOrTrivia.fold(
    (failure) => emit(Error(
      error: _mapFailureToMessage(failure),
    )),
    (trivia) {
      emit(Yuklandi(triviaRaqami: trivia));
    },
  );
}

String _mapFailureToMessage(XatoBilan failure) {
  switch (failure.runtimeType) {
    case ServerXato:
      return SERVER_FAILURE_MESSAGE;
    case CacheXato:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
