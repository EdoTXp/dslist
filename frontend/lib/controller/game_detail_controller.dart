import 'package:flutter/material.dart';
import 'package:frontend/models/game_model.dart';
import 'package:frontend/repositories/game_repository.dart';

class GameDetailController extends ChangeNotifier {
  final GameRepository _gameRepository;
  GameModel? game;
  bool isLoading = false;
  String? error;

  GameDetailController({required GameRepository gameRepository})
      : _gameRepository = gameRepository;
  bool get hasError => error != null;

  Future<void> fetchGameById(int id) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      game = await _gameRepository.getGameById(id);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
