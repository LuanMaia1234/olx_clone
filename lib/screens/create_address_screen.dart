import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:olxclone/services/viacep_service.dart';
import 'package:olxclone/stores/address_store.dart';
import 'package:olxclone/stores/user_store.dart';
import 'package:olxclone/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class CreateAddressScreen extends StatefulWidget {
  @override
  _CreateAddressScreenState createState() => _CreateAddressScreenState();
}

class _CreateAddressScreenState extends State<CreateAddressScreen> {
  UserStore _userStore;
  final FocusNode _focusNode = FocusNode();
  final AddressStore _addressStore = AddressStore();
  final _zipCodeController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _complementController = TextEditingController();
  final _referenceController = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  ViaCepService viaCepService = ViaCepService();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() async {
      if (!_focusNode.hasFocus) {
        Map<String, dynamic> result =
            await viaCepService.getAddress(_zipCodeController.text);
        if (result.isNotEmpty) {
          _streetController.text = result['logradouro'];
          _addressStore.district = result['bairro'];
          _addressStore.city = result['localidade'];
          _addressStore.state = result['uf'];
        }
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
    _zipCodeController.dispose();
    _streetController.dispose();
    _numberController.dispose();
    _complementController.dispose();
    _referenceController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo endereço'),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Observer(
                      builder: (_) => CustomTextField(
                        label: 'CEP*',
                        hintText: '',
                        obscure: false,
                        keyboardType: TextInputType.number,
                        controller: _zipCodeController,
                        maskFormatter: [maskFormatter],
                        focusNode: _focusNode,
                        errorText: _addressStore.zipCodeErrorMessage,
                      ),
                    ),
                    SizedBox(height: 20),
                    Observer(
                      builder: (_) => CustomTextField(
                        label: 'Rua*',
                        hintText: '',
                        obscure: false,
                        controller: _streetController,
                        errorText: _addressStore.streetErrorMessage,
                      ),
                    ),
                    SizedBox(height: 20),
                    Observer(
                      builder: (_) => CustomTextField(
                        label: 'Numero*',
                        hintText: '',
                        obscure: false,
                        keyboardType: TextInputType.number,
                        controller: _numberController,
                        errorText: _addressStore.numberErrorMessage,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: 'Complemento',
                      hintText: '',
                      obscure: false,
                      controller: _complementController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: 'Ponto de referência',
                      hintText: '',
                      obscure: false,
                      controller: _referenceController,
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('Salvar endereço',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                      ),
                      color: Colors.orange,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      onPressed: () {
                        _addressStore.isLoading = true;
                        _addressStore.validateZipCode(_zipCodeController.text);
                        _addressStore.validateStreet(_streetController.text);
                        _addressStore.validateNumber(_numberController.text);
                        _addressStore.setReference(_referenceController.text);
                        _addressStore.setComplement(_complementController.text);
                        if (_addressStore.isFormValid) {
                          _addressStore.save(_userStore.user.uid);
                        }
                        _addressStore.isLoading = false;
                        Navigator.of(context).popAndPushNamed('/address',
                            result: 'Endereço cadastrado');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Observer(
            builder: (_) => IgnorePointer(
              ignoring: !_addressStore.isLoading,
              child: Container(
                color: _addressStore.isLoading
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
