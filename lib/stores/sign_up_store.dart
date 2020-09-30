import 'package:mobx/mobx.dart';
import 'package:olxclone/helpers/user_auth.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  //Observables
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String nameErrorMessage;

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
    if (emailValid && name.length >= 3 && password.length >= 8) {
      return true;
    } else {
      return false;
    }
  }

  //Actions
  @action
  void validateName(String value) {
    name = value;
    if (name.length >= 3) {
      nameErrorMessage = null;
    } else {
      nameErrorMessage = 'Por favor, preencha ao menos 3 caracteres.';
    }
  }

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
    if (password.length >= 8) {
      passwordErrorMessage = null;
    } else {
      passwordErrorMessage = 'Senha muito curta. Use 8 ou mais caracteres';
    }
  }

  Future<String> signUp() async {
    UserAuth userAuth = UserAuth();
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);
    Map<String, dynamic> userData = {
      'name': name.trim(),
      'email': email.trim(),
      'password': password.trim(),
      'document': null,
      'phone': null,
      'zip_code': null,
      'street': null,
      'number': null,
      'complement': null,
      'reference': null,
      'gender': 'undefined',
      'district': null,
      'city': null,
      'state': null,
      'created_at': date,
    };
    String userId = await userAuth.signUp(userData);
    return userId;
  }
}
