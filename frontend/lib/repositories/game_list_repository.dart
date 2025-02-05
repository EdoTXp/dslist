import 'package:frontend/api/api.dart';
import 'package:frontend/models/game_list_model.dart';
import 'package:frontend/models/game_model.dart';

class GameListRepository {
  final Api _api;

  GameListRepository({required Api api}) : _api = api;

  Future<List<GameListModel>> getGamesList() async {
    final response = await _api.get('/lists');
    final gamesList = (response.data as List)
        .map((map) => GameListModel.fromMap(map))
        .toList();

    return gamesList;
  }

  Future<List<GameModel>> getGamesByListId(int listId) async {
    final response = await _api.get('/lists/$listId/games');
    final games =
        (response.data as List).map((map) => GameModel.fromMap(map)).toList();

    return games;
  }

  Future<void> replacementGameOnList(
    int listId,
    int sourceIndex,
    int destinationIndex,
  ) async {
    await _api.post(
      '/lists/$listId/replacement',
      {
        'sourceIndex': sourceIndex,
        'destinationIndex': destinationIndex,
      },
    );
  }
}
