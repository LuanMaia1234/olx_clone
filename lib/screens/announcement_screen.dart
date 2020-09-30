import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:olxclone/helpers/utils.dart';
import 'package:olxclone/models/announcement.dart';
import 'package:olxclone/models/user.dart';
import 'package:olxclone/repositories/user_repository.dart';
import 'package:olxclone/screens/chat_announcement_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnouncementScreen extends StatefulWidget {
  final Announcement announcement;

  AnnouncementScreen({@required this.announcement});

  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  int currentImage = 1;
  PageController _pageController = PageController();
  int currentPageView = 0;
  User user;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anúncio'),
      ),
      body: FutureBuilder<User>(
        future: loadUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 250,
                    child: PageView(
                      controller: _pageController,
                      children: <Widget>[
                        for (String image in widget.announcement.images)
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 150,
                                left: 150,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 2),
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Text(
                                      "$currentImage/${widget.announcement.images.length}",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                            ],
                          ),
                      ],
                      onPageChanged: (index) {
                        setState(() {
                          currentImage = index + 1;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                        widget.announcement.price != null
                            ? 'R\$${widget.announcement.price.toStringAsFixed(2)}'
                            : '',
                        style: TextStyle(fontSize: 23)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(widget.announcement.title,
                        style: TextStyle(fontSize: 17)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                        'Publicado em ${widget.announcement.createdAt.day} ${Utils.monthsInYear(widget.announcement.createdAt.month)} ${widget.announcement.createdAt.hour}:${widget.announcement.createdAt.minute}',
                        style: TextStyle(fontSize: 14)),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Descrição',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(widget.announcement.description,
                        style: TextStyle(fontSize: 17)),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Detalhes',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Tipo', style: TextStyle(fontSize: 17)),
                        Text(widget.announcement.category,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Localização',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('CEP', style: TextStyle(fontSize: 17)),
                        Text(widget.announcement.zipCode,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Município', style: TextStyle(fontSize: 17)),
                        Text(widget.announcement.city,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Bairro', style: TextStyle(fontSize: 17)),
                        Text(widget.announcement.district,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Anunciante',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        width: 1,
                        color: Colors.grey[350],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Text(user.name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 17,
                                    width: 17,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: Icon(Icons.phone,
                                        size: 11, color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    height: 17,
                                    width: 17,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: Icon(Icons.mail,
                                        size: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                              user.createdAt != null
                                  ? 'Na OLX desde ${Utils.monthsInYear(user.createdAt.month)} de ${user.createdAt.year}'
                                  : 'Na OLX desde novembro de 2015',
                              style: TextStyle(fontSize: 13)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.chat_bubble_outline, size: 21),
                  SizedBox(width: 8),
                  Text('Chat',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            color: Colors.orange,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatAnnouncementScreen(
                      announcement: widget.announcement, user: user)));
            },
          ),
          SizedBox(width: 10),
          Visibility(
            visible: !widget.announcement.hidePhone,
            child: FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.phone, size: 21),
                    SizedBox(width: 8),
                    Text('Ligar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              color: Colors.orange[50],
              textColor: Colors.orange,
              shape: RoundedRectangleBorder(side: BorderSide(
                  color: Colors.orange,
                  width: 1,
              ), borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                launch('tel:${user.phone}');
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<User> loadUser() async {
    UserRepository userRepository = UserRepository();
    await userRepository.find(widget.announcement.uid).then((result) {
      user = result;
    });
    return user;
  }
}
