import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:olxclone/models/user.dart';

class UserRepository {
  Future<void> update(String uid, Map<String, dynamic> userData) {
    return Firestore.instance
        .collection('users')
        .document(uid)
        .updateData(userData);
  }

  Future<User> find(String uid) async {
    DocumentSnapshot userSnapshot =
        await Firestore.instance.collection('users').document(uid).get();
    if (userSnapshot.data != null) {
      Map<String, dynamic> mapData = userSnapshot.data;
      mapData['uid'] = uid;
      mapData['created_at'] =
          mapData['created_at'] != null ? mapData['created_at'].toDate() : null;
      User user = User.fromMap(mapData);
      return user;
    }
    return null;
  }
}
