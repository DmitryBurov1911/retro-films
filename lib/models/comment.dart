import 'package:hive/hive.dart';

part 'comment.g.dart';

@HiveType(typeId: 1)
class Comment {
  @HiveField(0)
  final String user;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final DateTime date;

  Comment({
    required this.user,
    required this.content,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'content': content,
      'date': date.toIso8601String(),
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      user: map['user'] ?? '',
      content: map['content'] ?? '',
      date: DateTime.parse(map['date']),
    );
  }
}
