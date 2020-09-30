import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxclone/helpers/utils.dart';
import 'package:olxclone/models/user.dart';
import 'package:olxclone/screens/filter_categories_screen.dart';
import 'package:olxclone/screens/filter_screen.dart';
import 'package:olxclone/screens/no_internet_connection_screen.dart';
import 'package:olxclone/screens/region_screen.dart';
import 'package:olxclone/stores/home_store.dart';
import 'package:olxclone/stores/user_store.dart';
import 'package:olxclone/widgets/custom_drawer.dart';
import 'package:olxclone/widgets/home_announcements.dart';
import 'package:olxclone/widgets/top_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserStore _userStore;
  HomeStore _homeStore;
  bool connected = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
    _userStore.getCurrentUser();
    _homeStore = Provider.of<HomeStore>(context);
    _homeStore.getAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    Utils.checkConnectivity().then((value){
      setState(() {
        connected = value;
      });
    });
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      drawer: CustomDrawer(userStore: _userStore),
      body: connected ? Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Observer(
                builder: (_) => _homeStore.currentState == null
                    ? TopCard(text: 'DDD 24', screen: RegionScreen(), idCard: 0)
                    : TopCard(
                        text: _homeStore.currentState,
                        screen: RegionScreen(),
                        idCard: 0),
              ),
              Observer(
                builder: (_) => _homeStore.currentCategory == null
                    ? TopCard(
                        text: 'Categoria',
                        screen: FilterCategoriesScreen(),
                        idCard: 1)
                    : TopCard(
                        text: _homeStore.currentCategory,
                        screen: FilterCategoriesScreen(),
                        idCard: 1),
              ),
              TopCard(text: 'Filtros', screen: FilterScreen(), idCard: 2),
            ],
          ),
          HomeAnnouncements(homeStore: _homeStore),
        ],
      ) : NoInternetConnectionScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: connected,
        child: FlatButton(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.camera_alt),
                SizedBox(width: 5),
                Text('Anunciar agora',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          color: Colors.orange,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          onPressed: () {
            if (_userStore.user != null) {
              Navigator.of(context).pushNamed('/createAnnouncement');
            } else {
              Navigator.of(context).pushNamed('/signIn');
            }
          },
        ),
      ),
    );
  }
}
