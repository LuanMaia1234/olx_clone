import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:olxclone/helpers/user_auth.dart';
import 'package:olxclone/models/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User user;

  @action
  Future<User> getCurrentUser() async {
    UserAuth userAuth = UserAuth();
    FirebaseUser firebaseUser = await userAuth.getCurrentUser();
    if (firebaseUser != null) {
      DocumentSnapshot userSnapshot = await Firestore.instance.collection('users').document(firebaseUser.uid).get();
      Map<String, dynamic> mapData = userSnapshot.data;
      mapData['uid'] = firebaseUser.uid;
      mapData['created_at'] = mapData['created_at'].toDate();
      user = User.fromMap(mapData);
      return user;
    } else {
      return null;
    }
  }
}