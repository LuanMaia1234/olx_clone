import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isLogo;
  final String routeName;

  DrawerTile(
      {this.icon,
      @required this.text,
      this.isLogo = false,
      @required this.routeName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
        child: Row(
          children: <Widget>[
            !isLogo
                ? Icon(
                    icon,
                    size: 25,
                    color: ModalRoute.of(context).settings.name == routeName
                        ? Colors.orange
                        : Colors.black,
                  )
                : Image.asset('images/olxlogolocation.png', height: 25),
            SizedBox(width: 15),
            Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ModalRoute.of(context).settings.name == routeName
                      ? Colors.orange
                      : Colors.black),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
    );
  }
}
