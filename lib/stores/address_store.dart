import 'package:mobx/mobx.dart';
import 'package:olxclone/repositories/user_repository.dart';
import 'package:olxclone/services/viacep_service.dart';

part 'address_store.g.dart';

class AddressStore = _AddressStore with _$AddressStore;

abstract class _AddressStore with Store {
  //Observables
  @observable
  String zipCode = '';

  @observable
  String street = '';

  @observable
  String number;

  @observable
  String complement = '';

  @observable
  String reference = '';

  @observable
  String district = '';

  @observable
  String city = '';

  @observable
  String state = '';

  @observable
  String zipCodeErrorMessage;

  @observable
  String streetErrorMessage;

  @observable
  String numberErrorMessage;

  @observable
  bool isLoading = false;

  //Computed
  @computed
  bool get isFormValid {
    if (zipCodeErrorMessage == null && street.length > 0 && number.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  //Actions
  @action
  void validateZipCode(String value) async {
    zipCode = value;
    ViaCepService viaCepService = ViaCepService();
    if (zipCode.length == 9) {
      Map<String, dynamic> result = await viaCepService.getAddress(zipCode);
      if (result.isNotEmpty) {
        zipCodeErrorMessage = null;
      } else {
        zipCodeErrorMessage = 'Informe um CEP válido';
      }
    } else {
      zipCodeErrorMessage = 'Informe um CEP válido';
    }
  }

  @action
  void validateStreet(String value) {
    street = value;
    if (street.length > 0) {
      streetErrorMessage = null;
    } else {
      streetErrorMessage = 'Obrigatório';
    }
  }

  @action
  void validateNumber(String value) {
    number = value;
    if (number.length > 0) {
      numberErrorMessage = null;
    } else {
      numberErrorMessage = 'Obrigatório';
    }
  }

  @action
  void setComplement(String value) {
    complement = value;
  }

  @action
  void setReference(String value) {
    reference = value;
  }

  void save(String uid) {
    UserRepository userRepository = UserRepository();
    Map<String, dynamic> userData = {
      'zip_code': zipCode.trim(),
      'street': street.trim(),
      'number': number.trim(),
      'complement': complement.isNotEmpty ? complement.trim() : null,
      'reference': reference.isNotEmpty ? reference.trim() : null,
      'district': district.isNotEmpty ? district : null,
      'city': city.isNotEmpty ? city : null,
      'state': state.isNotEmpty ? state : null,
    };
    userRepository.update(uid, userData);
  }
}
