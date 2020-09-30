import 'package:flutter/material.dart';
import 'package:olxclone/helpers/utils.dart';

class RegionScreen extends StatelessWidget {
  final List<Map<String,dynamic>> listData = Utils.getStates();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Região'),
      ),
      body: ListView.separated(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: index == 0 ? Icon(Icons.my_location) : Text(''),
            title: index == 0 ? Text(listData[index]['state'],style: TextStyle(fontWeight: FontWeight.w500),) : Text(listData[index]['state']),
            onTap: () {
              Navigator.of(context).pop(listData[index]);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 1,height: 0);
        },
      ),
    );
  }
}
