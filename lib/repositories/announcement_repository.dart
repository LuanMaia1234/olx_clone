import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:olxclone/models/announcement.dart';

class AnnouncementRepository {
  Future<String> create(Announcement announcement, List<File> images) async {
    try {
      List<String> urlImage = [];
      DocumentReference result = await Firestore.instance
          .collection('announcements')
          .add(announcement.toMap());

      await Future.forEach(images, (file) async {
        int index = images.indexOf(file) + 1;
        final StorageReference storageReference = FirebaseStorage()
            .ref()
            .child('images/${result.documentID}/photo$index');
        final StorageUploadTask uploadTask = storageReference.putFile(file);
        final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
        String url = await downloadUrl.ref.getDownloadURL();
        urlImage.add(url);
      });

      Firestore.instance
          .collection('announcements')
          .document(result.documentID)
          .updateData({'id': result.documentID, 'images': urlImage});

      return result.documentID;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<List<Announcement>> getAllApproved(
      {Map<String, dynamic> filter}) async {
    try {
      List<Announcement> list = [];
      Query query = Firestore.instance
          .collection('announcements')
          .where('status', isEqualTo: 'approved');
      if (filter != null) {
        if (filter.containsKey('category')) {
          query = query.where('category', isEqualTo: filter['category']);
        }
        if (filter.containsKey('state')) {
          query = query.where('state', isEqualTo: filter['state']);
        }
        if (filter.containsKey('minPrice') && !filter.containsKey('maxPrice')) {
          query = query.where('price',
              isGreaterThanOrEqualTo: int.parse(filter['minPrice']));
        }
        if (filter.containsKey('maxPrice') && !filter.containsKey('minPrice')) {
          query = query.where('price',
              isLessThanOrEqualTo: int.parse(filter['maxPrice']));
        }
        if (filter.containsKey('minPrice') && filter.containsKey('maxPrice')) {
          query = query
              .where('price',
                  isGreaterThanOrEqualTo: int.parse(filter['minPrice']))
              .where('price',
                  isLessThanOrEqualTo: int.parse(filter['maxPrice']));
        }
        if (filter.containsKey('orderBy') &&
            filter['orderBy'] == 'price' &&
            (filter.containsKey('minPrice') ||
                filter.containsKey('maxPrice'))) {
          query = query.orderBy('price', descending: true);
        } else if (filter.containsKey('orderBy') &&
            filter['orderBy'] == 'created_at') {
          query = query.orderBy('created_at', descending: true);
        }
      }
      await query.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((result) {
          Map<String, dynamic> map = result.data;
          map['images'] = List<String>.from(map['images']);
          map['created_at'] = map['created_at'].toDate();
          list.add(Announcement.fromMap(map));
        });
      });

      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
