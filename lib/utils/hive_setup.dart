import 'package:hive_flutter/hive_flutter.dart';
import '../models/movie.dart';
import '../models/user.dart';
import '../models/comment.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(CommentAdapter());
  await Hive.openBox<Movie>('movies');
  await Hive.openBox<UserModel>('users');
}
