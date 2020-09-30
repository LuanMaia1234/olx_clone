import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:olxclone/models/announcement.dart';
import 'package:olxclone/models/announcement_message.dart';
import 'package:olxclone/models/user.dart';
import 'package:olxclone/stores/chat_announcement_store.dart';
import 'package:olxclone/stores/user_store.dart';
import 'package:provider/provider.dart';

class ChatAnnouncementScreen extends StatefulWidget {
  final Announcement announcement;
  final User user;

  ChatAnnouncementScreen({@required this.announcement, @required this.user});

  @override
  _ChatAnnouncementScreenState createState() => _ChatAnnouncementScreenState();
}

class _ChatAnnouncementScreenState extends State<ChatAnnouncementScreen> {
  ChatAnnouncementStore _chatAnnouncementStore;
  final _messageController = TextEditingController();
  UserStore _userStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
  }

  @override
  void initState() {
    super.initState();
    _chatAnnouncementStore = ChatAnnouncementStore();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: Card(
              margin: EdgeInsets.zero,
              child: Row(
                children: <Widget>[
                  Image.network(widget.announcement.images[0],
                      width: 60, fit: BoxFit.fitWidth),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.announcement.title),
                      SizedBox(height: 3),
                      Text(
                          widget.announcement.price != null
                              ? 'R\$${widget.announcement.price.toStringAsFixed(2)}'
                              : '',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection('announcement_messages')
                  .where('announcement_id', isEqualTo: widget.announcement.id)
                  .orderBy('created_at')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DocumentSnapshot> documents =
                      snapshot.data.documents.toList();
                  return ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> map = documents[index].data;
                        map['created_at'] = map['created_at'].toDate();
                        AnnouncementMessage announcementMessage =
                            AnnouncementMessage.fromMap(map);
                        return ListTile(
                          title: Text(announcementMessage.message),
                          subtitle: Text(
                              '${announcementMessage.createdAt.hour}:${announcementMessage.createdAt.minute}'),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  );
                }
              },
            ),
          ),
          Divider(),
          Observer(
            builder: (_) => Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration.collapsed(
                        hintText: '   Digite uma mensagem...'),
                    onChanged: (value) {
                      _chatAnnouncementStore.setMessage(value);
                    },
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.send,
                      color: _chatAnnouncementStore.message.length > 0
                          ? Colors.black26
                          : Colors.black12,
                    ),
                    onPressed: _chatAnnouncementStore.message.length > 0
                        ? () {
                            if (_chatAnnouncementStore.isFormValid) {
                              _chatAnnouncementStore
                                  .setAnnouncementId(widget.announcement.id);
                              _chatAnnouncementStore
                                  .setUid(_userStore.user.uid);
                              if (widget.announcement.uid ==
                                  _userStore.user.uid) {
                                _chatAnnouncementStore.setAnnouncer(true);
                                _chatAnnouncementStore.setPurchaser(false);
                              } else {
                                _chatAnnouncementStore.setAnnouncer(false);
                                _chatAnnouncementStore.setPurchaser(true);
                              }
                              _chatAnnouncementStore.create();
                              _messageController.text = '';
                            }
                          }
                        : null),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
