import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olxclone/stores/user_store.dart';
import 'package:olxclone/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha conta'),
        actions: <Widget>[
          GestureDetector(
            child: Container(
                margin: EdgeInsets.all(20),
                child: Text('EDITAR',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
            onTap: () {
              Navigator.of(context).pushNamed('/accountData');
            },
          ),
        ],
      ),
      drawer: CustomDrawer(userStore: _userStore),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Center(
              child: Text('${_userStore.user.name}',
                  style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w500),textAlign: TextAlign.center),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text('Meus anúncios',style: TextStyle(color: primaryColor, fontSize: 16,fontWeight: FontWeight.w500)),
            ),
            onTap: (){

            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text('Favoritos',style: TextStyle(color: primaryColor, fontSize: 16,fontWeight: FontWeight.w500)),
            ),
            onTap: (){

            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text('Buscas salvas',style: TextStyle(color: primaryColor, fontSize: 16,fontWeight: FontWeight.w500)),
            ),
            onTap: (){

            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text('Meu perfil',style: TextStyle(color: primaryColor, fontSize: 16,fontWeight: FontWeight.w500)),
            ),
            onTap: (){

            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text('Plano profissional',style: TextStyle(color: primaryColor, fontSize: 16,fontWeight: FontWeight.w500)),
            ),
            onTap: (){

            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text('Segurança da Conta',style: TextStyle(color: primaryColor, fontSize: 16,fontWeight: FontWeight.w500)),
            ),
            onTap: (){

            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text('Configuração de comunicações',style: TextStyle(color: primaryColor, fontSize: 16,fontWeight: FontWeight.w500)),
            ),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }
}
