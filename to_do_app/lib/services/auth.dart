import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CustomUser _userFromFirebase(User? user) {
    return user != null ? CustomUser(uid: user.uid) : CustomUser(uid: '0');
  }

  Stream<CustomUser> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user));
  }

  Future SignInAnon() async {
    try {
      final UserCredential result = await _auth.signInAnonymously();
      User user = result.user as User;
      return _userFromFirebase(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }
}
