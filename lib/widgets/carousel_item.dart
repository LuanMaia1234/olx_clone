import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olxclone/models/announcement.dart';
import 'package:olxclone/screens/announcement_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class CarouselItem extends StatelessWidget {
  final Announcement announcement;

  CarouselItem({this.announcement});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20, right: 8),
        height: 130,
        width: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: announcement.images[0],
                    fit: BoxFit.fitWidth,
                    width: 110),
              ),
            ),
            SizedBox(height: 5),
            Text(announcement.title, overflow: TextOverflow.ellipsis),
            Text(announcement.price != null
                ? 'R\$${announcement.price.toStringAsFixed(2)}'
                : ''),
          ],
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
