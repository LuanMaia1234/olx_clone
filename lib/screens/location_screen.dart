import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:olxclone/helpers/utils.dart';
import 'package:olxclone/services/geolocator_service.dart';
import 'package:olxclone/stores/home_store.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GeolocatorService _geolocatorService;
  HomeStore _homeStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _geolocatorService = GeolocatorService();
    _homeStore = Provider.of<HomeStore>(context);

    _geolocatorService.getCurrentAddressPosition().then((position) {
      String uf = Utils.getUfByStateName(position[0].administrativeArea);
      Map<String, dynamic> filter = {
        'state': uf,
      };
      Future.delayed(Duration(seconds: 1), () {
        _homeStore.getAnnouncements(filter: filter).then((_) {
          Navigator.of(context).pop();
        });
      });
    });
  }

//  @override
//  void initState() {
//    super.initState();
//    _geolocatorService = GeolocatorService();
//    _geolocatorService.getCurrentAddressPosition();
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: AppBar(
            elevation: 0,
          )),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(Icons.location_on, color: Colors.purple, size: 55),
            ),
            Text(
              'Buscando sua\n localização atual',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 21, color: Colors.grey),
            ),
            SizedBox(height: 100),
            Container(
              height: 200,
              width: 200,
              child: FlareActor('flare/AnimCircle.flr', animation: 'pulse'),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        width: MediaQuery.of(context).size.width - 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Selecionar manualmente:',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            FlatButton(
              child: Text('Escolher estado',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
