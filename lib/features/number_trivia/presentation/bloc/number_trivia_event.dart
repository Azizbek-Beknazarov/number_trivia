import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TriviaRaqamiEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// 1 event
class GetTriviRaqamAniq extends TriviaRaqamiEvent {
  final String raqamString;

  GetTriviRaqamAniq(this.raqamString);



  @override
  List<Object> get props => [raqamString];
}

// 2 event
class GetTriviaRaqamTasodif extends TriviaRaqamiEvent {}
