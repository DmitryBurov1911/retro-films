import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retro_films/ui/movie_list_screen.dart';
import 'package:retro_films/bloc/movie_cubit.dart';
import 'package:retro_films/models/movie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final sampleMovies = [
    Movie(
      id: '1',
      title: 'Movie 1',
      genre: 'Action',
      description: 'Action movie description.',
      imageUrl: 'https://www.example.com/movie1.jpg',
      videoUrl: '',
      comments: [],
    ),
    Movie(
      id: '2',
      title: 'Movie 2',
      genre: 'Drama',
      description: 'Drama movie description.',
      imageUrl: 'https://www.example.com/movie2.jpg',
      videoUrl: '',
      comments: [],
    ),
  ];

  runApp(MyApp(sampleMovies: sampleMovies));
}

class MyApp extends StatelessWidget {
  final List<Movie> sampleMovies;

  MyApp({required this.sampleMovies});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCubit>(
      create: (context) => MovieCubit()..loadMovies(sampleMovies),
      child: MaterialApp(
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MovieListScreen(),
      ),
    );
  }
}
