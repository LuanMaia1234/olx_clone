import 'package:mobx/mobx.dart';
import 'package:olxclone/helpers/user_auth.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {

  //Observables
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String emailErrorMessage;

  @observable
  String passwordErrorMessage;

  @observable
  bool isLoading = false;

  //Computed
  @computed
  bool get isFormValid {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid && password.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  //Actions
  @action
  void validateEmail(String value) {
    email = value;
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      emailErrorMessage = null;
    } else {
      emailErrorMessage = 'Por favor, insira um endereço de e-mail válido.';
    }
  }

  @action
  void validatePassword(String value) {
    password = value;
    if (password.length > 0) {
      passwordErrorMessage = null;
    } else {
      passwordErrorMessage = 'Este campo é obrigatório.';
    }
  }

  @action
  Future<String> signIn() async {
    UserAuth userAuth = UserAuth();
    String userId = await userAuth.signIn(email.trim(), password.trim());

    return userId;
  }

  @action
  Future<String> facebookSignIn() async {
    UserAuth userAuth = UserAuth();
    String userId = await userAuth.facebookSignIn();
    return userId;
  }

  @action
  Future<String> googleSignIn() async {
    UserAuth userAuth = UserAuth();
    String userId = await userAuth.googleSignIn();
    return userId;
  }
}
