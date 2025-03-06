import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retro_films/models/comment.dart';
import 'package:retro_films/models/movie.dart';

class MovieCubit extends Cubit<List<Movie>> {
  MovieCubit() : super([]);

  void loadMovies(List<Movie> movies) {
    emit(movies);
  }

  void addMovie(Movie movie) {
    final updatedMovies = List<Movie>.from(state)..add(movie);
    emit(updatedMovies);
  }

  void removeMovie(String movieId) {
    final updatedMovies = state.where((movie) => movie.id != movieId).toList();
    emit(updatedMovies);
  }

  void addComment(String movieId, String user, String commentText) {
    final movieIndex = state.indexWhere((movie) => movie.id == movieId);
    if (movieIndex != -1) {
      final movie = state[movieIndex];

      final newComment = Comment(
        user: user,
        content: commentText,
        date: DateTime.now(),
      );

      movie.comments.add(newComment);

      final updatedMovie = movie.copyWith(comments: movie.comments);
      final updatedMovies = List<Movie>.from(state);
      updatedMovies[movieIndex] = updatedMovie;
      emit(updatedMovies);
    }
  }
}
