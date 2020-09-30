import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxclone/models/user.dart';
import 'package:olxclone/stores/user_store.dart';
import 'package:olxclone/widgets/drawer_tile.dart';
import 'drawer_text_tile.dart';
import 'home_announcements.dart';

class CustomDrawer extends StatelessWidget {
  final UserStore userStore;

//  CustomDrawer({@required this.userStore});
  CustomDrawer({@required this.userStore});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              color: Theme.of(context).primaryColor,
              child: Row(
                children: <Widget>[
                  Icon(Icons.person_outline, color: Colors.white, size: 30),
                  SizedBox(width: 10),
                  Observer(
                    builder: (_) => userStore.user != null
                        ? Text(
                            ' ${userStore.user.name}\n ${userStore.user.email}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          )
                        : FlatButton(
                            padding: EdgeInsets.zero,
                            child: Text('Acesse sua conta agora!\nClique aqui',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/signIn');
                            },
                          ),
                  ),
                ],
              ),
            ),
            DrawerTile(
              text: 'Anúncios',
              isLogo: true,
              routeName: '/home',
            ),
            DrawerTile(
              icon: Icons.create,
              text: 'Inserir Anúncio',
              routeName:
                  userStore.user != null ? '/createAnnouncement' : '/signIn',
            ),
            DrawerTile(
                icon: Icons.notifications_none,
                text: 'Notificações',
                routeName: userStore.user != null ? '/notifications' : '/signIn'),
            DrawerTile(
                icon: Icons.chat_bubble_outline,
                text: 'Chat',
                routeName: userStore.user != null ? '/chat' : '/signIn'),
            DrawerTile(
                icon: Icons.favorite_border,
                text: 'Favoritos',
                routeName: userStore.user != null ? '/favorites' : '/signIn'),
            DrawerTile(
                icon: Icons.person_outline,
                text: 'Minha Conta',
                routeName: userStore.user != null ? '/myAccount' : '/signIn'),
            Divider(color: Colors.grey),
            DrawerTextTile(text: 'Ajuda e Contato'),
            DrawerTextTile(text: 'Dúvidas Frequentes'),
            DrawerTextTile(text: 'Dicas de Segurança'),
            DrawerTextTile(text: 'Termos de Uso'),
            DrawerTextTile(text: 'Avalie na Google Play'),
            DrawerTextTile(text: 'Curta no Facebook'),
          ],
        ),
      ),
    );
  }
}
