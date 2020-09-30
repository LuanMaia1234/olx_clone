import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olxclone/screens/account_data_screen.dart';
import 'package:olxclone/screens/address_screen.dart';
import 'package:olxclone/screens/chat_screen.dart';
import 'package:olxclone/screens/create_address_screen.dart';
import 'package:olxclone/screens/create_announcement_screen.dart';
import 'package:olxclone/screens/favorites_screen.dart';
import 'package:olxclone/screens/home_screen.dart';
import 'package:olxclone/screens/location_screen.dart';
import 'package:olxclone/screens/my_account_screen.dart';
import 'package:olxclone/screens/notification_screen.dart';
import 'package:olxclone/screens/sign_in_screen.dart';
import 'package:olxclone/screens/sign_up_screen.dart';
import 'package:olxclone/stores/home_store.dart';
import 'package:olxclone/stores/user_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(OlxApp());
}

class OlxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => UserStore()),
        Provider<HomeStore>(create: (_) => HomeStore()),
      ],
      child: MaterialApp(
        title: 'Olx clone',
        theme: ThemeData(
          primaryColor: Color(0xFF6d09d7),
        ),
//      home: HomeScreen(),
//      home: LocationScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreen(),
          '/createAnnouncement': (context) => CreateAnnouncementScreen(),
          '/location': (context) => LocationScreen(),
          '/signIn': (context) => SignInScreen(),
          '/signUp': (context) => SignUpScreen(),
          '/myAccount': (context) => MyAccountScreen(),
          '/accountData': (context) => AccountDataScreen(),
          '/favorites': (context) => FavoritesScreen(),
          '/chat': (context) => ChatScreen(),
          '/notifications': (context) => NotificationScreen(),
          '/address': (context) => AddressScreen(),
          '/createAddress': (context) => CreateAddressScreen(),
        },
      ),
    );
  }
}
