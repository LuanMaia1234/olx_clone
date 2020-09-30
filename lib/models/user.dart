class User {
  String uid;
  String name;
  String email;
  String phone;
  String zipCode;
  String street;
  String number;
  String complement;
  String reference;
  String document;
  String gender;
  String district;
  String city;
  String state;
  DateTime createdAt;

  User();

  User.fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    zipCode = map['zip_code'];
    street = map['street'];
    number = map['number'];
    complement = map['complement'];
    reference = map['reference'];
    document = map['document'];
    gender = map['gender'];
    district = map['district'];
    city = map['city'];
    state = map['state'];
    createdAt = map['created_at'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'zip_code': zipCode,
      'street': street,
      'number': number,
      'complement': complement,
      'reference': reference,
      'document': document,
      'gender': gender,
      'district': district,
      'city': city,
      'state': state,
      'created_at': createdAt,
    };
    return map;
  }

  @override
  String toString() {
    return 'uid: $uid,'
        ' name: $name,'
        ' email: $email,'
        ' phone: $phone,'
        ' zip_code: $zipCode,'
        ' street: $street,'
        ' number: $number,'
        ' complement: $complement,'
        ' reference: $reference,'
        ' document: $document,'
        ' gender: $gender,'
        ' district: $district,'
        ' city;'
        ' $city';
  }
}
