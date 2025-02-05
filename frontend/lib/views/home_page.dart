import 'package:flutter/material.dart';

import 'package:frontend/config/dependencies.dart';
import 'package:frontend/controller/game_controller.dart';
import 'package:frontend/models/game_list_model.dart';
import 'package:frontend/views/widgets/game_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GameController controller;
  List<GameListModel> gamesList = [];
  int selectedListId = 0;

  @override
  void initState() {
    super.initState();
    controller = injector.get<GameController>();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await controller.fetchGames();
    await controller.fetchGameList();

    setState(() {
      gamesList = controller.gamesList;
      gamesList.insert(0, GameListModel(id: 0, name: 'Todos os jogos'));
    });
  }

  void _reorderList(oldIndex, newIndex) async {
    newIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;

    await controller.replacementGameOnList(
      selectedListId,
      oldIndex,
      newIndex,
    );

    await controller.fetchGamesByListId(selectedListId);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSList Games'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              await controller.fetchGames();
              setState(() => selectedListId = gamesList.first.id);
            },
          ),
          DropdownButton<int>(
            value: selectedListId,
            items: gamesList.map(
              (gameList) {
                return DropdownMenuItem<int>(
                  value: gameList.id,
                  child: Text(gameList.name),
                );
              },
            ).toList(),
            onChanged: (listId) async {
              if (listId != null) {
                setState(() {
                  selectedListId = listId;
                });

                if (selectedListId == 0) {
                  await controller.fetchGames();
                } else {
                  await controller.fetchGamesByListId(listId);
                }
              }
            },
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.hasError) {
            return Center(
              child: Text('An error occurred: ${controller.error}'),
            );
          }

          final games = controller.games;

          final itemCount = games.length;

          return selectedListId == 0
              ? ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return GameCard(
                      key: ValueKey(game.id),
                      id: game.id,
                      name: game.title,
                      description: game.shortDescription,
                      imageUrl: game.imgUrl,
                    );
                  },
                )
              : ReorderableListView.builder(
                  itemCount: itemCount,
                  onReorder: _reorderList,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return GameCard(
                      key: ValueKey(game.id),
                      id: game.id,
                      name: game.title,
                      description: game.shortDescription,
                      imageUrl: game.imgUrl,
                    );
                  },
                );
        },
      ),
    );
  }
}
