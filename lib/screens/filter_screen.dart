import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olxclone/screens/filter_categories_screen.dart';
import 'package:olxclone/screens/region_screen.dart';
import 'package:olxclone/stores/home_store.dart';
import 'package:olxclone/widgets/custom_text_field.dart';
import 'package:olxclone/widgets/state_dialog.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with SingleTickerProviderStateMixin {
  final _categoryController = TextEditingController();
  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();
  final _stateController = TextEditingController();
  final FocusNode _categoryFocusNode = FocusNode();
  final FocusNode _stateFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  String currentOrderButton = 'relevance';
  String currentAnnouncer = 'particular';

  @override
  void initState() {
    super.initState();
    _categoryFocusNode.addListener(() async {
      if (_categoryFocusNode.hasFocus) {
        final category = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FilterCategoriesScreen()));
        if (category != null) {
          _categoryController.text = category;
        }
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      }
    });
    _stateFocusNode.addListener(() async {
      if (_stateFocusNode.hasFocus) {
        await showDialog(
            context: context,
            builder: (context) {
              return StateDialog();
            }).then((result) {
          _stateController.text = result;
        });
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      }
    });
  }

  @override
  void dispose() {
    _stateController.dispose();
    _stateFocusNode.dispose();
    _categoryController.dispose();
    _categoryFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final _homeStore = Provider.of<HomeStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar busca'),
        actions: <Widget>[
          GestureDetector(
            child: Container(
                margin: EdgeInsets.all(20),
                child: Text('LIMPAR',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
            onTap: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 5),
              Text('Seleciona a Categoria',
                  style: TextStyle(color: primaryColor)),
              CustomTextField(
                label: '',
                hintText: 'Todas as categorias',
                obscure: false,
                controller: _categoryController,
                showCursor: false,
                focusNode: _categoryFocusNode,
              ),
              SizedBox(height: 20),
              Text('Localização', style: TextStyle(color: primaryColor)),
              CustomTextField(
                label: '',
                hintText: 'Todos os estados',
                obscure: false,
                controller: _stateController,
                showCursor: false,
                focusNode: _stateFocusNode,
              ),
              SizedBox(height: 20),
              Text('Ordenação por', style: TextStyle(color: primaryColor)),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                        ),
                        color: currentOrderButton == 'created_at'
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('data',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: currentOrderButton == 'created_at'
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentOrderButton = 'created_at';
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                        ),
                        color: currentOrderButton == 'price'
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('preço',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: currentOrderButton == 'price'
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentOrderButton = 'price';
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                        ),
                        color: currentOrderButton == 'relevance'
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('relevância',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: currentOrderButton == 'relevance'
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentOrderButton = 'relevance';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Preço (R\$)', style: TextStyle(color: primaryColor)),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 15,
                    child: CustomTextField(
                      label: '',
                      hintText: 'Min',
                      obscure: false,
                      controller: _minPriceController,
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 15,
                    child: CustomTextField(
                      label: '',
                      hintText: 'Max',
                      obscure: false,
                      controller: _maxPriceController,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Tipo de anunciante', style: TextStyle(color: primaryColor)),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                        ),
                        color: currentAnnouncer == 'particular'
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('particular',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: currentAnnouncer == 'particular'
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentAnnouncer = 'particular';
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                        ),
                        color: currentAnnouncer == 'professional'
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('profissional',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: currentAnnouncer == 'professional'
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentAnnouncer = 'professional';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: FlatButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Filtrar',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                  ),
                  color: Colors.orange,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  onPressed: () {
                    Map<String, dynamic> filter = {};
                    if (_stateController.text.isNotEmpty && _stateController.text != 'Todos os estados') {
                      filter['state'] = _stateController.text;
                    }
                    if (_categoryController.text.isNotEmpty && _categoryController.text != 'Todas as categorias') {
                      filter['category'] = _categoryController.text;
                    }
                    if (currentOrderButton != 'relevance') {
                      filter['orderBy'] = currentOrderButton;
                    }
                    if (_minPriceController.text.isNotEmpty) {
                      filter['minPrice'] = _minPriceController.text;
                    }
                    if (_maxPriceController.text.isNotEmpty) {
                      filter['maxPrice'] = _maxPriceController.text;
                    }
                    _homeStore.getAnnouncements(filter: filter);
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
