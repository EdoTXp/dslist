import 'package:flutter/material.dart';
import 'package:frontend/models/game_list_model.dart';
import 'package:frontend/models/game_model.dart';
import 'package:frontend/repositories/game_list_repository.dart';
import 'package:frontend/repositories/game_repository.dart';

class GameController extends ChangeNotifier {
  final GameRepository _gameRepository;
  final GameListRepository _gameListRepository;

  List<GameModel> games = [];
  List<GameListModel> gamesList = [];
  bool isLoading = false;
  String? error;
  bool get hasError => error != null;

  GameController({
    required GameRepository gameRepository,
    required GameListRepository gameListRepository,
  })  : _gameRepository = gameRepository,
        _gameListRepository = gameListRepository;

  Future<void> fetchGames() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      games = await _gameRepository.getGames();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchGameList() async {
    notifyListeners();
    try {
      gamesList = await _gameListRepository.getGamesList();
    } catch (e) {
      error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> fetchGamesByListId(int listId) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      games = await _gameListRepository.getGamesByListId(listId);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> replacementGameOnList(
    int listId,
    int sourceIndex,
    int destinationIndex,
  ) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      await _gameListRepository.replacementGameOnList(
        listId,
        sourceIndex,
        destinationIndex,
      );
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
