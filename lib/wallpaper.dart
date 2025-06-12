import 'package:chat_bot/categories.dart';
import 'package:chat_bot/chatpage1.dart';
import 'package:chat_bot/chatpage2.dart';
import 'package:chat_bot/chatpage3.dart';
import 'package:chat_bot/chatpage4.dart';
import 'package:chat_bot/chatpage5.dart';
import 'package:chat_bot/customize.dart';
import 'package:chat_bot/history.dart';
import 'package:chat_bot/home.dart';
import 'package:chat_bot/language.dart';
import 'package:chat_bot/login.dart';
import 'package:chat_bot/settings.dart';
import 'package:chat_bot/signup.dart';
import 'package:chat_bot/terms.dart';
import 'package:chat_bot/themes.dart';
import 'package:flutter/material.dart';

class ChatBotApp extends StatefulWidget {
  @override
  _ChatBotAppState createState() => _ChatBotAppState();
}

class _ChatBotAppState extends State<ChatBotApp> {
  String _currentWallpaper = 'assets/daek aquatic color (3).jpg';

  void updateWallpaper(String newWallpaper) {
    setState(() {
      _currentWallpaper = newWallpaper;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatBot',
      theme: ThemeData.dark(),
      home: HomePage(currentWallpaper: _currentWallpaper, updateWallpaperCallback: (value) { },),
      routes: {
        '/login': (context) => LoginPage(currentWallpaper: _currentWallpaper),
        '/signup': (context) => SignInPage(currentWallpaper: _currentWallpaper),
        '/categories': (context) => CategoriesPage(currentWallpaper: _currentWallpaper,updateWallpaperCallback: updateWallpaper,),

        '/chat1': (context) => ChatPage1(currentWallpaper: _currentWallpaper,updateWallpaperCallback: updateWallpaper,),
        '/chat2': (context) => ChatPage2(currentWallpaper: _currentWallpaper,updateWallpaperCallback: updateWallpaper,),
        '/chat3': (context) => ChatPage3(currentWallpaper: _currentWallpaper,updateWallpaperCallback: updateWallpaper,),
        '/chat4': (context) => ChatPage4(currentWallpaper: _currentWallpaper,updateWallpaperCallback: updateWallpaper,),
        '/chat5': (context) => ChatPage5(currentWallpaper: _currentWallpaper,updateWallpaperCallback: updateWallpaper,),
        
        '/settings': (context) => SettingsPage(updateWallpaperCallback: updateWallpaper, currentWallpaper: _currentWallpaper),
        '/history': (context) => HistoryPage(currentWallpaper: _currentWallpaper),
        '/language': (context) => LanguagePage(currentWallpaper: _currentWallpaper),
        '/customize': (context) => CustomizeChatbotPage(currentWallpaper: _currentWallpaper),
        '/terms': (context) => Termsandconditions(currentWallpaper: _currentWallpaper),
        '/themes': (context) => ThemesPage(onWallpaperSelected: updateWallpaper, currentWallpaper: _currentWallpaper),
      },
    );
  }
}






class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final String backgroundImage;

  const BackgroundContainer({required this.child, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          backgroundImage,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        child,
      ],
    );
  }
}
