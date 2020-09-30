import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:olxclone/models/announcement.dart';
import 'package:olxclone/repositories/announcement_repository.dart';
import 'package:olxclone/services/viacep_service.dart';

part 'create_announcement_store.g.dart';

class CreateAnnouncementStore = _CreateAnnouncementStore
    with _$CreateAnnouncementStore;

abstract class _CreateAnnouncementStore with Store {
  //Observables
  @observable
  ObservableList<File> images = ObservableList<File>();

  @observable
  String title = '';

  @observable
  String description = '';

  @observable
  String category = '';

  @observable
  String zipCode = '';

  @observable
  String price = '';

  @observable
  bool hidePhone = true;

  @observable
  bool isLoading = false;

  @observable
  bool zipCodeValidated = false;

  @observable
  String titleErrorMessage;

  @observable
  String descriptionErrorMessage;

  @observable
  String categoryErrorMessage;

  @observable
  String zipCodeErrorMessage;

  @observable
  String imagesErrorMessage;

  Map<String, dynamic> resultApi = {};

  //Computed
  @computed
  bool get isFormValid {
    if (title.length >= 3 &&
        description.length >= 3 &&
        category.length >= 3 &&
        zipCodeValidated &&
        images.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  //Actions
  @action
  void setImage(File image) {
    images.add(image);
  }

  @action
  void removeImage(int index) {
    images.removeAt(index);
  }

  @action
  void setHidePhone(bool value) {
    hidePhone = value;
  }

  @action
  void setPrice(String value) {
    price = value;
  }

  @action
  Future<void> validateZipCode(String value) async {
    zipCode = value;
    if (zipCode.length == 9) {
      ViaCepService viaCepService = ViaCepService();
      Map<String, dynamic> result = await viaCepService.getAddress(zipCode);
      if (result.isNotEmpty) {
        resultApi = result;
        zipCodeValidated = true;
        zipCodeErrorMessage = null;
      } else {
        zipCodeErrorMessage = 'Informe um CEP válido';
        zipCodeValidated = false;
      }
    } else {
      zipCodeErrorMessage = 'Informe um CEP válido';
      zipCodeValidated = false;
    }
  }

  @action
  Future<void> validateFields(
      String title, String description, String category) async {
    this.title = title;
    this.description = description;
    this.category = category;
    this.hidePhone = hidePhone;
    if (this.title.length >= 3) {
      titleErrorMessage = null;
    } else {
      titleErrorMessage = 'Digite pelo menos 3 caracteres';
    }
    if (this.description.length >= 3) {
      descriptionErrorMessage = null;
    } else {
      descriptionErrorMessage = 'Digite pelo menos 3 caracteres';
    }
    if (this.category.length >= 3) {
      categoryErrorMessage = null;
    } else {
      categoryErrorMessage = 'Esse campo é obrigatório';
    }
    if (zipCodeValidated) {
      zipCodeErrorMessage = null;
    } else {
      zipCodeErrorMessage = 'Informe um CEP válido';
    }
    if (images.length > 0) {
      imagesErrorMessage = null;
    } else {
      imagesErrorMessage = 'Insira pelo menos 1 foto';
    }
  }

  Future<String> create(String uid) async {
    AnnouncementRepository announcementRepository = AnnouncementRepository();
    Announcement announcement = Announcement();
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);
    announcement.title = title.trim();
    announcement.uid = uid;
    announcement.description = description.trim();
    announcement.category = category;
    announcement.zipCode = zipCode;
    announcement.hidePhone = hidePhone;
    announcement.status = 'pending';
    announcement.district = resultApi['bairro'];
    announcement.city = resultApi['localidade'];
    announcement.state = resultApi['uf'];
    announcement.price = price.isNotEmpty ? int.parse(price.replaceAll('.', '').replaceAll(',', '')) : null;
    announcement.createdAt = date;
    String documentID =
        await announcementRepository.create(announcement, images);
    return documentID;
  }
}
