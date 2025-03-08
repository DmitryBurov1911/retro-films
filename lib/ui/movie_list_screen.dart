import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retro_films/bloc/movie_cubit.dart';
import 'package:retro_films/models/movie.dart';
import 'package:retro_films/ui/custom_app_bar.dart';
import 'package:retro_films/ui/movie_detail_screen.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(),
          SliverPadding(
            padding: const EdgeInsets.only(top: 16.0),
            sliver: BlocBuilder<MovieCubit, List<Movie>>(
              builder: (context, movies) {
                if (movies.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Нет фильмов.',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  );
                }

                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final movie = movies[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailScreen(movie: movie),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(8.0)
                                  ),
                                  child: Image.network(
                                    movie.imageUrl,
                                    fit: BoxFit.fitHeight,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    movie.genre,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      );
                    },
                    childCount: movies.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
