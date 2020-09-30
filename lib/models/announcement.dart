import 'package:cloud_firestore/cloud_firestore.dart';

class Announcement {
  String id;
  List<String> images;
  String title;
  String uid;
  String description;
  String category;
  String zipCode;
  bool hidePhone;
  String status;
  String district;
  String city;
  String state;
  int price;
  DateTime createdAt;

  Announcement();

  Announcement.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    images = map['images'];
    title = map['title'];
    uid = map['uid'];
    description = map['description'];
    category = map['category'];
    zipCode = map['zip_code'];
    hidePhone = map['hide_phone'];
    status = map['status'];
    district = map['district'];
    city = map['city'];
    state = map['state'];
    price = map['price'];
    createdAt = map['created_at'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'images': images,
      'title': title,
      'uid': uid,
      'description': description,
      'category': category,
      'zip_code': zipCode,
      'hide_phone': hidePhone,
      'status': status,
      'district': district,
      'city': city,
      'state': state,
      'price': price,
      'created_at': createdAt,
    };
    return map;
  }

  @override
  String toString() {
    return 'images: $images,'
        ' title: $title,'
        ' id: $id,'
        ' uid: $uid,'
        ' description: $description,'
        ' category: $category,'
        ' zip_code: $zipCode,'
        ' hide_phone: $hidePhone,'
        ' status: $status,'
        ' destrict: $district,'
        ' city: $city,'
        ' state: $state,'
        ' price: $price,'
        ' created_at;'
        ' $createdAt';
  }
}
