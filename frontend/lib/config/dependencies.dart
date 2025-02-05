import 'package:auto_injector/auto_injector.dart';
import 'package:frontend/api/api.dart';
import 'package:frontend/api/game_api.dart';
import 'package:frontend/controller/game_controller.dart';
import 'package:frontend/controller/game_detail_controller.dart';
import 'package:frontend/repositories/game_list_repository.dart';
import 'package:frontend/repositories/game_repository.dart';

final injector = AutoInjector();

setupDependencies() {
  injector.addSingleton<Api>(
    () => GameApi(baseUrl: 'http://localhost:8080'),
  );
  injector.addSingleton(GameRepository.new);
  injector.addSingleton(GameListRepository.new);
  injector.addSingleton(GameController.new);
  injector.addSingleton(GameDetailController.new);

  injector.commit();
}
