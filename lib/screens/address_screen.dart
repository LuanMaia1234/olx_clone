import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxclone/stores/user_store.dart';
import 'package:olxclone/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Endereço'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Card(
          child: Observer(
            builder: (_) => _userStore.user.zipCode != null &&
                _userStore.user.street != null &&
                _userStore.user.number != null
                ? _buildUserAddress(_userStore)
                : _buildAddAddress(primaryColor,context),
          ),
        ),
      ),
    );
  }
  Widget _buildUserAddress(UserStore userStore){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10,left: 10),
          child: Text('${userStore.user.street}\n${userStore.user.city}, ${userStore.user.number}',style: TextStyle(fontSize:15,fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('${userStore.user.district}'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('${userStore.user.street}, ${userStore.user.state}'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('${userStore.user.zipCode}'),
        ),
      ],
    );
  }
  Widget _buildAddAddress(Color primaryColor,context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Adicionar novo endereço',
                    style: TextStyle(
                        fontSize: 16, color: primaryColor)),
                Icon(Icons.add, color: primaryColor),
              ],
            ),
          ),
          onTap: () async {
            final result = await Navigator.of(context)
                .pushNamed('/createAddress');
            if (result == 'Endereço cadastrado') {
              Flushbar(
                message: result,
                duration: Duration(seconds: 2),
              )..show(context);
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 5, 12, 10),
          child: Divider(thickness: 2),
        ),
      ],
    );
  }
}
