import 'dart:convert';
import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

//Local data source

abstract class TriviaRaqamiLDS {
  Future<TriviaRaqamiModel> getOxirgiTRaqami();

  Future<void> cacheTRaqami(TriviaRaqamiModel cacheGaRaqam);
}

class TriviaRaqamiLDSImple implements TriviaRaqamiLDS {
  final SharedPreferences preferences;

  TriviaRaqamiLDSImple({required this.preferences});

  @override
  Future<void> cacheTRaqami(TriviaRaqamiModel cacheGaRaqam) {
    return preferences.setString(
        CACHED_NUMBER_TRIVIA, jsonEncode(cacheGaRaqam.toJson()));
  }

  @override
  Future<TriviaRaqamiModel> getOxirgiTRaqami() {
    final jsonString = preferences.getString(CACHED_NUMBER_TRIVIA);
    if (jsonString != null) {
      return Future.value(TriviaRaqamiModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
