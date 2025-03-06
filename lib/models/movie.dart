import 'package:hive/hive.dart';
import 'comment.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie {
  @HiveField(0)
  final String id;  // Уникальный идентификатор фильма
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String genre;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String imageUrl;
  @HiveField(5)
  final String videoUrl;
  @HiveField(6)
  final List<Comment> comments;

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.description,
    required this.imageUrl,
    required this.videoUrl,
    required this.comments,
  });

  // Метод копирования с возможностью изменения полей
  Movie copyWith({
    String? id,
    String? title,
    String? genre,
    String? description,
    String? imageUrl,
    String? videoUrl,
    List<Comment>? comments,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      genre: genre ?? this.genre,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'genre': genre,
      'description': description,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'comments': comments.map((e) => e.toMap()).toList(),
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      genre: map['genre'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      comments: List<Comment>.from(map['comments']?.map((x) => Comment.fromMap(x))),
    );
  }
}
