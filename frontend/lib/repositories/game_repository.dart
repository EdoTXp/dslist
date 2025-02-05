import 'package:frontend/api/api.dart';
import 'package:frontend/models/game_model.dart';

class GameRepository {
  final Api _gameApi;

  GameRepository({required Api api}) : _gameApi = api;

  Future<List<GameModel>> getGames() async {
    final response = await _gameApi.get('/games');
    final games =
        (response.data as List).map((map) => GameModel.fromMap(map)).toList();

    return games;
  }

  Future<GameModel> getGameById(int id) async {
    final response = await _gameApi.get('/games/$id');
    final game = GameModel.fromMap(response.data as Map<String, dynamic>);
    return game;
  }
}
