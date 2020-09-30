import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:olxclone/models/announcement_message.dart';

class AnnouncementMessageRepository {
  Future<String> create(AnnouncementMessage announcementMessage) async {
    try {
      DocumentReference result = await Firestore.instance
          .collection('announcement_messages')
          .add(announcementMessage.toMap());

      return result.documentID;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<List<AnnouncementMessage>> getAnnouncementMessages(String announcementId) async {
    try {
      List<AnnouncementMessage> list = [];
      Query query = Firestore.instance.collection('announcement_messages').where('announcement_id', isEqualTo: announcementId);
      await query.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((result) {
          Map<String, dynamic> map = result.data;
          map['created_at'] = map['created_at'].toDate();
          list.add(AnnouncementMessage.fromMap(map));
        });
      });
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
