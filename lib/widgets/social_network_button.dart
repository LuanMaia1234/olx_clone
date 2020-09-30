import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialNetworkButton extends StatelessWidget {
  final String image;
  final String text;
  final Color backgroundColor;
  final Future<String> signInFunction;

  SocialNetworkButton(
      {@required this.image,
      @required this.text,
      @required this.backgroundColor, @required this.signInFunction});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(image, height: 20, color: Colors.white),
            Text(text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

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
