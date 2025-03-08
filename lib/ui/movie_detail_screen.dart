import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    movie.imageUrl,
                    height: 250,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        movie.genre,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 40),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                movie.description,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: size.height / 40),
            // YouTube Player
            YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(movie.videoUrl) ?? '',
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                // Логика для добавления комментария
              },
              child: Container(
                height: 50,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "Оставить комментарий",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
