import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

class TriviaRaqamiModel extends TriviaRaqami {
  TriviaRaqamiModel({required String matn, required int raqam})
      : super(matn: matn, raqam: raqam);

  factory TriviaRaqamiModel.fromJson(Map<String, dynamic> json) {
    return TriviaRaqamiModel(
        matn: json['text'], raqam: (json['number'] as num).toInt());
  }

  Map<String, dynamic> toJson() {
    return ({
      'text': matn,
      'number': raqam,
    });
  }
}
