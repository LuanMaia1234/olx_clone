import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olxclone/stores/create_announcement_store.dart';

class ImageSourceSheet extends StatelessWidget {
  final picker = ImagePicker();
  final CreateAnnouncementStore createAnnouncementStore;

  ImageSourceSheet({@required this.createAnnouncementStore});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 20),
            Icon(Icons.camera_alt, color: Colors.black54),
            FlatButton(
              child: Text('Tirar foto',
                  style: TextStyle(color: Colors.black54, fontSize: 15)),
              onPressed: () async {
                final image = await picker.getImage(source: ImageSource.camera);
                if (image != null) {
                  createAnnouncementStore.setImage(File(image.path));
                }
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 20),
            Icon(Icons.picture_in_picture_alt, color: Colors.black54),
            FlatButton(
              child: Text('Escolher existente...',
                  style: TextStyle(color: Colors.black54, fontSize: 15)),
              onPressed: () async {
                final image =
                    await picker.getImage(source: ImageSource.gallery);
                if (image != null) {
                  createAnnouncementStore.setImage(File(image.path));
                }
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
