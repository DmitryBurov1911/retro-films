import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:retro_films/models/movie.dart';
import 'package:retro_films/models/comment.dart';

class MovieService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final Box<Movie> _movieBox = Hive.box<Movie>('movies');

  Future<void> addMovie(Movie movie) async {
    await _db.collection('movies').add(movie.toMap());
    await _movieBox.add(movie);
  }

  Future<List<Movie>> getMovies() async {
    final querySnapshot = await _db.collection('movies').get();
    final moviesFromFirestore = querySnapshot.docs.map((doc) => Movie.fromMap(doc.data())).toList();

    for (var movie in moviesFromFirestore) {
      if (!_movieBox.values.contains(movie)) {
        _movieBox.add(movie);
      }
    }

    return _movieBox.values.toList() + moviesFromFirestore;
  }
}
