import 'package:flutter/material.dart';
import 'package:frontend/views/game_detail_page.dart';

class GameCard extends StatelessWidget {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  const GameCard({
    super.key,
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => GameDetailPage(id: id),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          spacing: 8,
          children: [
            Image.network(
              imageUrl,
              width: 250,
              height: 150,
              fit: BoxFit.fill,
              errorBuilder: (context, _, __) => Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
