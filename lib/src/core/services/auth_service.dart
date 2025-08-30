import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/src/core/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  UserModel? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    // This is a placeholder for checking admin status.
    // In a real app, you'd have a 'users' collection in Firestore
    // to store user roles.
    return UserModel(uid: user.uid, email: user.email ?? '', isAdmin: user.email!.contains('admin'));
  }

  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  Future<UserModel?> createUserWithEmailAndPassword(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
