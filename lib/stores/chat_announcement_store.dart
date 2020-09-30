import 'package:mobx/mobx.dart';
import 'package:olxclone/models/announcement_message.dart';
import 'package:olxclone/repositories/announcement_message_repository.dart';

part 'chat_announcement_store.g.dart';

class ChatAnnouncementStore = _ChatAnnouncementStore
    with _$ChatAnnouncementStore;

abstract class _ChatAnnouncementStore with Store {
  @observable
  String message = '';

  @observable
  String uid = '';

  @observable
  String announcementId;

  @observable
  bool announcer;

  @observable
  bool purchaser;

  //Computed
  @computed
  bool get isFormValid {
    if (message.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  @action
  void setMessage(String value) {
    message = value;
  }

  @action
  void setUid(String value) {
    uid = value;
  }

  @action
  void setAnnouncementId(String value) {
    announcementId = value;
  }

  @action
  void setAnnouncer(bool value) {
    announcer = value;
  }

  @action
  void setPurchaser(bool value) {
    purchaser = value;
  }

  Future<String> create() async {
    AnnouncementMessage announcementMessage = AnnouncementMessage();
    AnnouncementMessageRepository announcementMessageRepository =
        AnnouncementMessageRepository();
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);
    announcementMessage.message = message;
    announcementMessage.uid = uid;
    announcementMessage.announcementId = announcementId;
    announcementMessage.announcer = announcer;
    announcementMessage.purchaser = purchaser;
    announcementMessage.createdAt = date;
    String documentID =
        await announcementMessageRepository.create(announcementMessage);
    return documentID;
  }
}
