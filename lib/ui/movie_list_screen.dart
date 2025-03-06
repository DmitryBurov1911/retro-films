import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retro_films/bloc/movie_cubit.dart';
import 'package:retro_films/models/movie.dart';
import 'package:retro_films/ui/custom_app_bar.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: BlocBuilder<MovieCubit, List<Movie>>(
          builder: (context, movies) {
            if (movies.isEmpty) {
              return Center(child: Text('Нет фильмов.'));
            }

            return GridView.builder(
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    // Переход на экран подробностей
                  },
                  child: Column(
                    children: [
                      Image.network(movie.imageUrl, height: 150),
                      Text(movie.title, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
