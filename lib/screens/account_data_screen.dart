import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:olxclone/helpers/user_auth.dart';
import 'package:olxclone/models/user.dart';
import 'package:olxclone/stores/account_data_store.dart';
import 'package:olxclone/stores/user_store.dart';
import 'package:olxclone/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AccountDataScreen extends StatefulWidget {
  @override
  _AccountDataScreenState createState() => _AccountDataScreenState();
}

class _AccountDataScreenState extends State<AccountDataScreen> {
  TextEditingController _nameController;
  TextEditingController _documentController;
  final UserAuth _userAuth = UserAuth();
  AccountDataStore _accountDataStore;
  UserStore _userStore;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
    _nameController = TextEditingController(text: _userStore.user.name);
    _documentController = TextEditingController(text: _userStore.user.document);
    _accountDataStore = AccountDataStore();
    _accountDataStore.setGender(_userStore.user.gender);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _documentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Dados da conta'),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Dados da conta',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Observer(
                      builder: (_) => CustomTextField(
                        label: 'Nome completo',
                        hintText: '',
                        obscure: false,
                        controller: _nameController,
                        errorText: _accountDataStore.nameErrorMessage,
                      ),
                    ),
                    SizedBox(height: 20),
                    Observer(
                      builder: (_) => CustomTextField(
                        label: 'CPF / CNPJ',
                        hintText: '',
                        obscure: false,
                        controller: _documentController,
                        keyboardType: TextInputType.number,
                        errorText: _accountDataStore.documentErrorMessage,
                        maskFormatter: [maskFormatter],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Gênero',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Observer(
                          builder: (_) => Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 24,
                            width: 24,
                            child: Radio(
                              value: 'female',
                              groupValue: _accountDataStore.gender,
                              onChanged: (value) {
                                _accountDataStore.setGender(value);
                                print(value);
                              },
                              activeColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Text('Feminino'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Observer(
                          builder: (_) => Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 24,
                            width: 24,
                            child: Radio(
                              value: 'male',
                              groupValue: _accountDataStore.gender,
                              onChanged: (value) {
                                _accountDataStore.setGender(value);
                              },
                              activeColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Text('Masculino'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Observer(
                          builder: (_) => Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 24,
                            width: 24,
                            child: Radio(
                              value: 'undefined',
                              groupValue: _accountDataStore.gender,
                              onChanged: (value) {
                                _accountDataStore.setGender(value);
                              },
                              activeColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Text('Não informar'),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Text('Tipo de conta  ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text('Particular', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('Salvar alterações',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                      ),
                      color: Colors.orange,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      onPressed: () {
                        _accountDataStore.isLoading = true;
                        _accountDataStore.validateName(_nameController.text);
                        _accountDataStore
                            .validateDocument(_documentController.text);
                        if (_accountDataStore.isFormValid) {
                          _accountDataStore.isLoading = false;
                          _accountDataStore.update(_userStore.user.uid);
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content:
                                  Text('Cadastro atualizado com sucesso')));
                        }
                        _accountDataStore.isLoading = false;
                      },
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Endereços',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.arrow_forward_ios,
                                  color: Theme.of(context).primaryColor,
                                  size: 16),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/address');
                      },
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Sair',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Icon(Icons.arrow_forward_ios,
                                  color: Theme.of(context).primaryColor,
                                  size: 16),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        _userAuth.signOut();
                        User user;
                        _userStore.user = user;
                        Navigator.of(context).pushNamed('/home');
                        Flushbar(
                          message: 'Você foi desconectado',
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        )..show(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Observer(
            builder: (_) => IgnorePointer(
              ignoring: !_accountDataStore.isLoading,
              child: Container(
                color: _accountDataStore.isLoading
                    ? Colors.black38
                    : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
