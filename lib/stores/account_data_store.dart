import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:mobx/mobx.dart';
import 'package:olxclone/repositories/user_repository.dart';

part 'account_data_store.g.dart';

class AccountDataStore = _AccountDataStore with _$AccountDataStore;

abstract class _AccountDataStore with Store {
  //Observables
  @observable
  String name = '';

  @observable
  String document = '';

  @observable
  String gender = '';

  @observable
  bool isLoading = false;

  @observable
  String nameErrorMessage;

  @observable
  String documentErrorMessage;

  //Computed
  @computed
  bool get isFormValid {
    if (name.length >= 3 && CPF.isValid(document)) {
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
  void validateDocument(String value) {
    document = value;
    if (CPF.isValid(document)) {
      documentErrorMessage = null;
    } else {
      documentErrorMessage = 'Digite um número de documento válido.';
    }
  }

  //Actions
  @action
  void setGender(String value) {
    gender = value;
  }

  void update(String uid) {
    UserRepository userRepository = UserRepository();
    Map<String, dynamic> userData = {
      'name': name.trim(),
      'document': document.trim(),
      'gender': gender,
    };
    userRepository.update(uid, userData);
  }
}
