import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxclone/stores/sign_in_store.dart';
import 'package:olxclone/widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInStore _signInStore = SignInStore();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Entrar'),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset('images/facebook.png',
                                  height: 20, color: Colors.white),
                              Text('Entrar com o Facebook',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                        color: Colors.blue[900],
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        onPressed: () async {
                          _signInStore.isLoading = true;
                          String userId = await _signInStore.facebookSignIn();
                          if (userId.isNotEmpty && userId != 'canceled') {
                            _signInStore.isLoading = false;
                            Navigator.of(context).pushNamed('/home');
                          } else if (userId.isEmpty) {
                            _signInStore.isLoading = false;
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    'Ocorreu um erro, por favor tente novamente'),
                                backgroundColor: Colors.red));
                          }
                          _signInStore.isLoading = false;
                        },
                      ),
                      SizedBox(height: 1),
                      FlatButton(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset('images/google.png',
                                  height: 20, color: Colors.white),
                              Text('Entrar com o Google',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                        color: Colors.blue[700],
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        onPressed: () async{
                          _signInStore.isLoading = true;
                          String userId = await _signInStore.googleSignIn();
                          if (userId.isNotEmpty) {
                            _signInStore.isLoading = false;
                            Navigator.of(context).pushNamed('/home');
                          } else {
                            _signInStore.isLoading = false;
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    'Ocorreu um erro, por favor tente novamente'),
                                backgroundColor: Colors.red));
                          }
                          _signInStore.isLoading = false;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              child: Divider(height: 30)),
                          SizedBox(width: 10),
                          Text('ou'),
                          SizedBox(width: 10),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              child: Divider(height: 30)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Observer(
                        builder: (_) => CustomTextField(
                          label: 'Email',
                          hintText: '',
                          obscure: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          errorText: _signInStore.emailErrorMessage,
                        ),
                      ),
                      SizedBox(height: 20),
                      Observer(
                        builder: (_) => CustomTextField(
                          label: 'Senha',
                          hintText: '',
                          obscure: true,
                          controller: _passwordController,
                          errorText: _signInStore.passwordErrorMessage,
                        ),
                      ),
                      SizedBox(height: 20),
                      FlatButton(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('Entrar',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                        ),
                        color: Colors.orange,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        onPressed: () async {
                          _signInStore.isLoading = true;
                          _signInStore.validateEmail(_emailController.text);
                          _signInStore
                              .validatePassword(_passwordController.text);
                          if (_signInStore.isFormValid) {
                            String userId = await _signInStore.signIn();
                            if (userId.isNotEmpty) {
                              _signInStore.isLoading = false;
                              Navigator.of(context).pushNamed('/home');
                            } else {
                              _signInStore.isLoading = false;
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'Email ou senha inválidos, por favor tente novamente'),
                                  backgroundColor: Colors.red));
                            }
                          }
                          _signInStore.isLoading = false;
                        },
                      ),
                      Divider(height: 30),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Não tem uma conta? ',
                                style: TextStyle(fontSize: 16)),
                            GestureDetector(
                              child: Text('Cadastre-se',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              onTap: () {
                                Navigator.of(context).pushNamed('/signUp');
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.grey[100]),
                        child: Text(
                            'Ao continuar, você concorda com os Termos de Uso e a Política de Privacidade da OLX, e também, em receber comunicações via e-mail'
                            'e push da OLX e seus parceiros'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Observer(
            builder: (_) => IgnorePointer(
              ignoring: !_signInStore.isLoading,
              child: Container(
                color: _signInStore.isLoading
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
