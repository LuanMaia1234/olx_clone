import 'package:flutter/material.dart';
class DrawerTextTile extends StatelessWidget {
  final String text;
  DrawerTextTile({@required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: EdgeInsets.fromLTRB(20,10,20,10),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}
