import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olxclone/helpers/utils.dart';
import 'package:olxclone/models/announcement.dart';
import 'package:olxclone/screens/announcement_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class AnnouncementTile extends StatelessWidget {
  final Announcement announcement;

  AnnouncementTile({@required this.announcement});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Card(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            children: <Widget>[
              FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: announcement.images[0],
                  fit: BoxFit.cover,
                  height: 140,
                  width: 140),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 2, 0, 10),
                      child: Text(announcement.title,
                          style: TextStyle(fontSize: 15)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 9, 0, 10),
                      child: Text(
                          announcement.price != null
                              ? 'R\$${announcement.price.toStringAsFixed(2)}'
                              : '',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 9, 0, 10),
                      child: Text(
                          '${announcement.createdAt.day} '
                          '${Utils.monthsInYear(announcement.createdAt.month)}'
                          ' ${announcement.createdAt.hour}:${announcement.createdAt.minute},'
                          ' ${announcement.city}',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                AnnouncementScreen(announcement: announcement)));
      },
    );
  }
}
