import 'package:flutter/material.dart';
import 'package:olxclone/stores/create_announcement_store.dart';

class RemoveImageSheet extends StatelessWidget {
  final CreateAnnouncementStore createAnnouncementStore;
  final int index;

  RemoveImageSheet(
      {@required this.createAnnouncementStore, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 20),
            Icon(Icons.delete_outline, color: Colors.black54),
            FlatButton(
              child: Text('Excluir',
                  style: TextStyle(color: Colors.black54, fontSize: 15)),
              onPressed: () {
                createAnnouncementStore.removeImage(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 20),
            Icon(Icons.close, color: Colors.black54),
            FlatButton(
              child: Text('Cancelar',
                  style: TextStyle(color: Colors.black54, fontSize: 15)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
