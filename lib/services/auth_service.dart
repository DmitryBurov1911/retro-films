import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:retro_films/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> registerWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        final userModel = UserModel(
          id: user.uid,
          email: user.email ?? '',
        );

        final box = await Hive.openBox<UserModel>('users');
        await box.put(user.uid, userModel);
      }

      return user;
    } catch (e) {
      print("Ошибка регистрации: $e");
      return null;
    }
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Ошибка входа: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
