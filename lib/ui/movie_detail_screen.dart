import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/video_player_widget.dart';
import '../widgets/comment_section.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(movie.imageUrl, height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movie.description, style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: VideoPlayerWidget(videoUrl: movie.videoUrl),
          ),
          CommentSection(movie: movie),
        ],
      ),
    );
  }
}
