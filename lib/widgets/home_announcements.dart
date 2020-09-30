import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olxclone/models/announcement.dart';
import 'package:olxclone/stores/home_store.dart';
import 'package:olxclone/widgets/carousel_item.dart';

import 'announcement_tile.dart';

class HomeAnnouncements extends StatelessWidget {
  final HomeStore homeStore;

  HomeAnnouncements({@required this.homeStore});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh: _refresh,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Observer(
                builder: (_) {
                  if (homeStore.state == HomeState.initial) {
                    return Container();
                  } else if (homeStore.state == HomeState.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                      ),
                    );
                  } else {
                    return homeStore.homeFuture.result.length > 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('Selecionamos para você!',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 180,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeStore.homeFuture.result.length,
                                  itemBuilder: (context, index) {
                                    Announcement announcement =
                                        homeStore.homeFuture.result[index];
                                    return CarouselItem(
                                      announcement: announcement,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('Mais anúncios',
                                  style: TextStyle(fontSize: 16)),
                              for (Announcement announcement
                                  in homeStore.homeFuture.result)
                                AnnouncementTile(
                                  announcement: announcement,
                                ),
                            ],
                          )
                        : Text('Nenhum anúncio encontrado',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<Null> _refresh() async{
    homeStore.getAnnouncements();
    return null;
  }
}
