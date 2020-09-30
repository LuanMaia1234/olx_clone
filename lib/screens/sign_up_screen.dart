import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxclone/stores/sign_up_store.dart';
import 'package:olxclone/widgets/custom_text_field.dart';
import 'package:olxclone/widgets/social_network_button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpStore _signUpStore = SignUpStore();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Cadastrar'),
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
                      SocialNetworkButton(
                        image: 'images/facebook.png',
                        text: 'Entrar com o Facebook',
                        backgroundColor: Colors.blue[900],
                      ),
                      SizedBox(height: 1),
                      SocialNetworkButton(
                        image: 'images/google.png',
                        text: 'Entrar com o Google',
                        backgroundColor: Colors.blue[700],
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
                          label: 'Nome',
                          hintText: 'Exemplo: João S.',
                          obscure: false,
                          controller: _nameController,
                          errorText: _signUpStore.nameErrorMessage,
                        ),
                      ),
                      SizedBox(height: 20),
                      Observer(
                        builder: (_) => CustomTextField(
                          label: 'Email',
                          hintText: '',
                          obscure: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          errorText: _signUpStore.emailErrorMessage,
                        ),
                      ),
                      SizedBox(height: 20),
                      Observer(
                        builder: (_) => CustomTextField(
                          label: 'Senha',
                          hintText: '',
                          obscure: true,
                          controller: _passwordController,
                          errorText: _signUpStore.passwordErrorMessage,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('8 ou mais caracteres',
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.end),
                      SizedBox(height: 10),
                      FlatButton(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('Cadastre-se',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                        ),
                        color: Colors.orange,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        onPressed: () async {
                          _signUpStore.isLoading = true;
                          _signUpStore.validateName(_nameController.text);
                          _signUpStore.validateEmail(_emailController.text);
                          _signUpStore
                              .validatePassword(_passwordController.text);
                          if (_signUpStore.isFormValid) {
                            String userId = await _signUpStore.signUp();
                            if (userId.isNotEmpty) {
                              _signUpStore.isLoading = false;
                              Navigator.of(context).pop();
                              Flushbar(
                                message: 'Cadastrado com sucesso',
                                duration: Duration(seconds: 2),
                              )..show(context);
                            } else {
                              _signUpStore.isLoading = false;
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'Ocorreu um erro, por favor tente novamente mais tarde'),
                                  backgroundColor: Colors.red));
                            }
                          }
                          _signUpStore.isLoading = false;
                        },
                      ),
                      Divider(height: 30),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Já tem uma conta? ',
                                style: TextStyle(fontSize: 16)),
                            GestureDetector(
                              child: Text('Entrar',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              onTap: () {
                                Navigator.of(context).pushNamed('/signIn');
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
              ignoring: !_signUpStore.isLoading,
              child: Container(
                color: _signUpStore.isLoading
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
