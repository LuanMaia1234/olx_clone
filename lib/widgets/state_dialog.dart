import 'package:flutter/material.dart';
import 'package:olxclone/helpers/utils.dart';

class StateDialog extends StatefulWidget {
  @override
  _StateDialogState createState() => _StateDialogState();
}

class _StateDialogState extends State<StateDialog> {
  final List<Map<String, dynamic>> listData = Utils.getStates();
  String currentState = 'Todos os estados';

  @override
  Widget build(BuildContext context) {
    listData.removeAt(0);
    listData.insert(0, {'uf': 'Todos os estados', 'state': 'Todos os estados'});
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
              child: Text('Estado',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            ),
            Divider(),
            for (var result in listData)
              Row(
                children: <Widget>[
                  Radio(
                    value: result['uf'],
                    groupValue: currentState,
                    onChanged: (value) {
                      setState(() {
                        currentState = value;
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                  Text(result['state'], style: TextStyle(fontSize: 15)),
                ],
              ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: new Text("CANCELAR", style: TextStyle(fontSize: 14)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: new Text("APLICAR", style: TextStyle(fontSize: 14)),
                  onPressed: () {
                    Navigator.of(context).pop(currentState);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
