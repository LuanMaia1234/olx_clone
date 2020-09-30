import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class UserAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  Future<String> signUp(Map<String, dynamic> userData) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: userData['email'],
        password: userData['password'],
      );
      firebaseUser = result.user;
      userData.remove('password');
      _saveUserData(userData);
      return firebaseUser.uid;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<void> signOut() {
    final facebookLogin = FacebookLogin();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    facebookLogin.logOut();
    return _auth.signOut();
  }

  Future<String> signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      firebaseUser = result.user;
      return firebaseUser.uid;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  Future<String> facebookSignIn() async {
    try {
      final facebookLogin = FacebookLogin();
      final FacebookLoginResult facebookResult =
          await facebookLogin.logIn(['email']);
      if (facebookResult.status == FacebookLoginStatus.loggedIn) {
        final String token = facebookResult.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
        final profile = json.decode(graphResponse.body);
        AuthCredential credential =
            FacebookAuthProvider.getCredential(accessToken: token);
        AuthResult result = await _auth.signInWithCredential(credential);
        firebaseUser = result.user;
        DateTime now = new DateTime.now();
        DateTime date = new DateTime(
            now.year, now.month, now.day, now.hour, now.minute, now.second);
        Map<String, dynamic> userData = {
          'name': profile['name'],
          'email': profile['email'],
          'document': null,
          'phone': null,
          'zip_code': null,
          'street': null,
          'number': null,
          'complement': null,
          'reference': null,
          'gender': 'undefined',
          'district': null,
          'city': null,
          'state': null,
          'created_at': date,
        };
        _saveUserData(userData);

        return firebaseUser.uid;
      } else if (facebookResult.status == FacebookLoginStatus.cancelledByUser) {
        return 'canceled';
      } else {
        return '';
      }
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> googleSignIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      AuthResult result = await _auth.signInWithCredential(credential);
      firebaseUser = result.user;

      DateTime now = new DateTime.now();
      DateTime date = new DateTime(
          now.year, now.month, now.day, now.hour, now.minute, now.second);
      Map<String, dynamic> userData = {
        'name': firebaseUser.displayName,
        'email': firebaseUser.email,
        'document': null,
        'phone': null,
        'zip_code': null,
        'street': null,
        'number': null,
        'complement': null,
        'reference': null,
        'gender': 'undefined',
        'district': null,
        'city': null,
        'state': null,
        'created_at': date,
      };
      _saveUserData(userData);

      return firebaseUser.uid;
    } catch (e) {
      print(e);
      return '';
    }
  }

  void facebookSignOut() {
    final facebookLogin = FacebookLogin();
    facebookLogin.logOut();
    _auth.signOut();
  }

  void _saveUserData(Map<String, dynamic> userData) {
    Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .setData(userData);
  }
}
