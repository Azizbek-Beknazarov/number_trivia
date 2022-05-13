import 'package:equatable/equatable.dart';

//Entity
class TriviaRaqami extends Equatable {
  final String matn;
  final int raqam;

  TriviaRaqami({required this.matn, required this.raqam});

  @override
  // TODO: implement props
  List<Object> get props => [matn, raqam];
}
