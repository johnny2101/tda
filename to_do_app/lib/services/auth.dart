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

  Future registerEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
        User user = result.user as User;
        
        return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
        User user = result.user as User;
        return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future SignOut() async{
    try{
      return await _auth.signOut();
    } catch (e){
      print(e.toString());
    }
  }
}
