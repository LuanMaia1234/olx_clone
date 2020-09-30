class AnnouncementMessage {
  String message;
  String uid;
  String announcementId;
  bool announcer;
  bool purchaser;
  DateTime createdAt;

  AnnouncementMessage();

  AnnouncementMessage.fromMap(Map<String, dynamic> map) {
    message = map['message'];
    uid = map['uid'];
    announcementId = map['announcement_id'];
    announcer = map['announcer'];
    purchaser = map['purchaser'];
    createdAt = map['created_at'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'message': message,
      'uid': uid,
      'announcement_id': announcementId,
      'announcer': announcer,
      'purchaser': purchaser,
      'created_at': createdAt,
    };
    return map;
  }

  @override
  String toString() {
    return 'message: $message,'
        ' uid: $uid,'
        ' announcementId: $announcementId,'
        ' announcer: $announcer,'
        ' purchaser: $purchaser,'
        ' createdAt: $createdAt,'
        ' $createdAt';
  }
}
