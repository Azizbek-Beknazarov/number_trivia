import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

//Remote Data Source
abstract class TriviaRaqamiRDS {
  Future<TriviaRaqamiModel> getAniqTriviaRaqami(int raqam);

  Future<TriviaRaqamiModel> getTasodifiyTriviaRaqami();
}

class TriviaRaqamiRDSImple implements TriviaRaqamiRDS {
  final http.Client client;

  TriviaRaqamiRDSImple({required this.client});

  @override
  Future<TriviaRaqamiModel> getAniqTriviaRaqami(int raqam) =>
      getTriviaRaqamFromURL('http://numbersapi.com/$raqam');

  @override
  Future<TriviaRaqamiModel> getTasodifiyTriviaRaqami() =>
      getTriviaRaqamFromURL('http://numbersapi.com/random');

  Future<TriviaRaqamiModel> getTriviaRaqamFromURL(String url) async {
    final response = await client.get(
      Uri.parse(url),//change
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return TriviaRaqamiModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
