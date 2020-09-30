import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olxclone/screens/categories_screen.dart';
import 'package:olxclone/stores/home_store.dart';
import 'package:provider/provider.dart';

class TopCard extends StatelessWidget {
  final String text;
  final Widget screen;
  final int idCard;

  TopCard({@required this.text, @required this.screen, @required this.idCard});

  @override
  Widget build(BuildContext context) {
    final _homeStore = Provider.of<HomeStore>(context);
    return InkWell(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 3,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 19, color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
      onTap: () async {
        final result = await Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => screen));
        if (result != null) {
          Map<String, dynamic> filter = {};
          if (idCard == 0) {
            if (result['state'] == 'Minha localização atual') {
              Navigator.of(context).pushNamed('/location');
            } else {
              filter['state'] = result['uf'];
              _homeStore.setCurrentState(result['state']);
            }
          } else if (idCard == 1) {
            if (result != 'Todas as categorias') {
              filter['category'] = result;
              _homeStore.setCurrentCategory(result);
            } else {
              _homeStore.setCurrentCategory('Categoria');
            }
          }
          _homeStore.getAnnouncements(filter: filter);
        }
      },
    );
  }
}
