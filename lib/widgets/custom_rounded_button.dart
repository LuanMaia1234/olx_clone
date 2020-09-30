import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final String image;
  final String text;
  final Color backgroundColor;
  CustomRoundedButton({@required this.image, @required this.text,@required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(image,height: 20,color: Colors.white),
            SizedBox(width: 5),
            Text(text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
      color: backgroundColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      onPressed: () {
        Navigator.of(context).pushNamed('/createAnnouncement');
      },
    );
  }
}
