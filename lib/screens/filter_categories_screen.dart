import 'package:flutter/material.dart';
class FilterCategoriesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> listData = [
    {'icon': Icons.home, 'category': 'Todas as categorias'},
    {'icon': Icons.home, 'category': 'Imóveis'},
    {'icon': Icons.directions_car, 'category': 'Auto e peças'},
    {'icon': Icons.event_seat, 'category': 'Para a sua casa'},
    {'icon': Icons.phone_iphone, 'category': 'Eletrônicos e celulares'},
    {'icon': Icons.music_note, 'category': 'Música e hobbies'},
    {'icon': Icons.blur_circular, 'category': 'Esportes e lazer'},
    {'icon': Icons.child_friendly, 'category': 'Artigos infantis'},
    {'icon': Icons.pets, 'category': 'Animais de estimação'},
    {'icon': Icons.redeem, 'category': 'Moda e beleza'},
    {'icon': Icons.business, 'category': 'Agro e indústria'},
    {'icon': Icons.local_activity, 'category': 'Comércio e escritório'},
    {'icon': Icons.work, 'category': 'Serviços'},
    {'icon': Icons.nature_people, 'category': 'Vagas de emprego'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todas as categorias'),
      ),
      body: ListView.separated(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: index == 0 ? Image.asset('images/olxlogolocation.png', height: 30) : Icon(listData[index]['icon']),
            title: Text(listData[index]['category']),
            onTap: () {
              Navigator.of(context).pop(listData[index]['category']);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 1, height: 0);
        },
      ),
    );
  }
}
