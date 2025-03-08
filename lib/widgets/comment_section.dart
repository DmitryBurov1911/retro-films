import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retro_films/bloc/movie_cubit.dart';
import 'package:retro_films/models/movie.dart';

class CommentSection extends StatelessWidget {
  final Movie movie;

  const CommentSection({required this.movie});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: movie.comments.length,
            itemBuilder: (context, index) {
              final comment = movie.comments[index];
              return ListTile(
                title: Text(comment.content),
                subtitle: Text('By ${comment.user} on ${comment.date}'),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Добавить комментарий...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  final commentText = _controller.text;
                  if (commentText.isNotEmpty) {
                    context.read<MovieCubit>().addComment(
                      movie.id,
                      'user123',
                      commentText,
                    );
                    _controller.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
