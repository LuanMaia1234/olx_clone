import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:olxclone/screens/categories_screen.dart';
import 'package:olxclone/stores/create_announcement_store.dart';
import 'package:olxclone/stores/user_store.dart';
import 'package:olxclone/widgets/custom_drawer.dart';
import 'package:olxclone/widgets/custom_text_field.dart';
import 'package:olxclone/widgets/image_source_sheet.dart';
import 'package:olxclone/widgets/remove_image_sheet.dart';
import 'package:provider/provider.dart';

class CreateAnnouncementScreen extends StatefulWidget {
  @override
  _CreateAnnouncementScreenState createState() =>
      _CreateAnnouncementScreenState();
}

class _CreateAnnouncementScreenState extends State<CreateAnnouncementScreen> {
  UserStore _userStore;
  final CreateAnnouncementStore _createAnnouncementStore =
      CreateAnnouncementStore();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  ScrollController _scrollController = ScrollController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() async {
      if (_focusNode.hasFocus) {
        final category = await Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CategoriesScreen()));
        if (category != null) {
          _categoryController.text = category;
        }
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _zipCodeController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Inserir anúncio'),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            child: Container(
                margin: EdgeInsets.all(20),
                child: Text('LIMPAR',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
            onTap: () {
              _clearFields();
            },
          ),
        ],
      ),
      drawer: CustomDrawer(userStore: _userStore),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 200,
                      color: Colors.grey[300],
                    ),
                    Center(
                      child: SizedBox(
                        height: 200,
                        child: Observer(
                          builder: (_) => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                _createAnnouncementStore.images.length != 6
                                    ? _createAnnouncementStore.images.length + 1
                                    : _createAnnouncementStore.images.length,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              if (index ==
                                  _createAnnouncementStore.images.length) {
                                return GestureDetector(
                                  child: Container(
                                    height: 180,
                                    width: _createAnnouncementStore
                                                .images.length ==
                                            0
                                        ? MediaQuery.of(context).size.width - 20
                                        : MediaQuery.of(context).size.width / 2,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.camera_alt,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 40),
                                        SizedBox(height: 5),
                                        Text('Incluir fotos',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                        SizedBox(height: 5),
                                        Text(
                                            '${_createAnnouncementStore.images.length} de 6 adicionadas'),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (_) {
                                          return ImageSourceSheet(
                                              createAnnouncementStore:
                                                  _createAnnouncementStore);
                                        });
                                  },
                                );
                              } else {
                                _goToElement(index);
                                return GestureDetector(
                                  child: Container(
                                    height: 180,
                                    width:
                                        MediaQuery.of(context).size.width - 200,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey[300],
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Image.file(
                                        _createAnnouncementStore.images[index],
                                        fit: BoxFit.cover),
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (_) {
                                          return RemoveImageSheet(
                                              createAnnouncementStore:
                                                  _createAnnouncementStore,
                                              index: index);
                                        });
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Observer(
                  builder: (_) => _createAnnouncementStore.imagesErrorMessage !=
                          null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10, left: 19),
                          child: Text(
                              _createAnnouncementStore.imagesErrorMessage,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 12.3),
                              textAlign: TextAlign.left),
                        )
                      : Container(),
                ),
                Text(''),
                Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Observer(
                          builder: (_) => CustomTextField(
                            label: 'Título do anúncio*',
                            hintText: 'Ex: Samsung S9 novo na caixa',
                            obscure: false,
                            controller: _titleController,
                            errorText:
                                _createAnnouncementStore.titleErrorMessage,
                          ),
                        ),
                        SizedBox(height: 20),
                        Observer(
                          builder: (_) => CustomTextField(
                            label: 'Descrição*',
                            hintText:
                                'Ex: Smartphone Samsung Galaxy S9 com 128gb de memória, com caixa, todos os cabos e sem marca de uso.',
                            maxLines: 4,
                            obscure: false,
                            controller: _descriptionController,
                            errorText: _createAnnouncementStore
                                .descriptionErrorMessage,
                          ),
                        ),
                        SizedBox(height: 20),
                        Observer(
                          builder: (_) => CustomTextField(
                            label: 'Categoria*',
                            hintText: 'Selecione uma categoria',
                            obscure: false,
                            controller: _categoryController,
                            errorText:
                                _createAnnouncementStore.categoryErrorMessage,
                            focusNode: _focusNode,
                            showCursor: false,
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: 'Preço (R\$)',
                          obscure: false,
                          keyboardType: TextInputType.number,
                          controller: _priceController,
                          maskFormatter: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            RealInputFormatter(centavos: true)
                          ],
                        ),
                        SizedBox(height: 20),
                        Observer(
                          builder: (_) => CustomTextField(
                            label: 'CEP*',
                            obscure: false,
                            keyboardType: TextInputType.number,
                            controller: _zipCodeController,
                            errorText:
                                _createAnnouncementStore.zipCodeErrorMessage,
                            maskFormatter: [maskFormatter],
                            onChanged: _onChanged,
                          ),
                        ),
                        Observer(
                          builder: (_) => _createAnnouncementStore
                                  .zipCodeValidated
                              ? Container(
                                  margin: EdgeInsets.only(top: 15, bottom: 5),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Text(
                                    '${_createAnnouncementStore.resultApi['bairro']}, ${_createAnnouncementStore.resultApi['localidade']}, ${_createAnnouncementStore.resultApi['uf']}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )
                              : Container(),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Observer(
                              builder: (_) => Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: _createAnnouncementStore.hidePhone,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (value) {
                                    _createAnnouncementStore
                                        .setHidePhone(value);
                                  },
                                ),
                              ),
                            ),
                            Text('Ocultar meu telefone neste anúncio',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25, bottom: 15),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.orange[50],
                            border: Border.all(
                              width: 1,
                              color: Colors.orange,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, bottom: 35),
                                child: Icon(Icons.info_outline,
                                    color: Colors.orange),
                              ),
                              Flexible(
                                child: Text(
                                    'Não pedimos códigos por ligação, WhatsApp ou chat. Desconfie se entrar em contato em nome da OLX.',
                                    style: TextStyle(fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                        FlatButton(
                          color: Colors.orange,
                          textColor: Colors.white,
                          child: Text('Enviar anúncio',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          onPressed: () async {
                            _createAnnouncementStore.isLoading = true;
                            _createAnnouncementStore.validateFields(
                                _titleController.text,
                                _descriptionController.text,
                                _categoryController.text);
                            _createAnnouncementStore
                                .setPrice(_priceController.text);
                            if (_createAnnouncementStore.isFormValid) {
                              String documentID = await _createAnnouncementStore
                                  .create(_userStore.user.uid);
                              if (documentID.isNotEmpty) {
                                _createAnnouncementStore.isLoading = false;
                                Navigator.of(context).pushNamed('/home');
                                Flushbar(
                                  message: 'Anúncio criado com sucesso',
                                  duration: Duration(seconds: 2),
                                )..show(context);
                              } else {
                                _createAnnouncementStore.isLoading = false;
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text(
                                        'Ocorreu um erro, por favor tente novamente mais tarde'),
                                    backgroundColor: Colors.red));
                              }
                            }
                            _createAnnouncementStore.isLoading = false;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                              'Ao publicar você concorda e aceita nossos Termos de Uso e Privacidade'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Observer(
            builder: (_) => IgnorePointer(
              ignoring: !_createAnnouncementStore.isLoading,
              child: Container(
                color: _createAnnouncementStore.isLoading
                    ? Colors.black38
                    : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goToElement(int index) {
    _scrollController.jumpTo(300.0 * index);
  }

  void _onChanged(String value) {
    if (value.length == 9) {
      _createAnnouncementStore.validateZipCode(value);
    } else {
      _createAnnouncementStore.zipCodeValidated = false;
    }
  }

  void _clearFields() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: new Text("Limpar todos os campos"),
            content:
                new Text("Você tem certeza que deseja limpar todos os campos?"),
            actions: <Widget>[
              new FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: new Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                color: Colors.orange,
                textColor: Colors.white,
                child: new Text("OK"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: () {
                  _titleController.text = '';
                  _descriptionController.text = '';
                  _categoryController.text = '';
                  _zipCodeController.text = '';
                  _createAnnouncementStore.images.clear();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
