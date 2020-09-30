import 'package:flutter/material.dart';
import 'package:olxclone/stores/user_store.dart';
import 'package:olxclone/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';
class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      drawer: CustomDrawer(userStore: _userStore),
    );
  }
}
