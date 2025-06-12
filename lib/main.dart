import 'package:chat_bot/weightmanagement.dart';
import 'package:chat_bot/chatviewmodel2.dart';
import 'package:chat_bot/chatviewmodel3.dart';
import 'package:chat_bot/chatviewmodel4.dart';
import 'package:chat_bot/chatviewmodel5.dart';
import 'package:chat_bot/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:chat_bot/categories.dart';
import 'package:chat_bot/chatpage1.dart';
import 'package:chat_bot/chatpage2.dart';
import 'package:chat_bot/chatpage3.dart';
import 'package:chat_bot/chatpage4.dart';
import 'package:chat_bot/chatpage5.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String initialWallpaper = 'assets/daek aquatic color (3).jpg';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => weightmanagement('AIzaSyDbVmY4LfyReN-WFAOzJWh2SuruJy4ur4Y')),
        ChangeNotifierProvider(create: (_) => ChronicViewModel('AIzaSyDbVmY4LfyReN-WFAOzJWh2SuruJy4ur4Y')),
        ChangeNotifierProvider(create: (_) => generalwellnessnutrition('AIzaSyDbVmY4LfyReN-WFAOzJWh2SuruJy4ur4Y')),
        ChangeNotifierProvider(create: (_) => Pediatricnutrition('AIzaSyDbVmY4LfyReN-WFAOzJWh2SuruJy4ur4Y')),
        ChangeNotifierProvider(create: (_) => Sportsnutrition('AIzaSyDbVmY4LfyReN-WFAOzJWh2SuruJy4ur4Y')),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => ChatBotApp(),
          '/categories': (context) => CategoriesPage(
                currentWallpaper: initialWallpaper,
                updateWallpaperCallback: (wallpaper) {},
              ),
          '/ChatPage1': (context) => Builder(
                builder: (context) => ChatPage1(
                  currentWallpaper: initialWallpaper,
                  updateWallpaperCallback: (wallpaper) {},
                ),
              ),
          '/ChatPage2': (context) => Builder(
                builder: (context) => ChatPage2(
                  currentWallpaper: initialWallpaper,
                  updateWallpaperCallback: (wallpaper) {},
                ),
              ),
          '/ChatPage3': (context) => Builder(
                builder: (context) => ChatPage3(
                  currentWallpaper: initialWallpaper,
                  updateWallpaperCallback: (wallpaper) {},
                ),
              ),
          '/ChatPage4': (context) => Builder(
                builder: (context) => ChatPage4(
                  currentWallpaper: initialWallpaper,
                  updateWallpaperCallback: (wallpaper) {},
                ),
              ),
          '/ChatPage5': (context) => Builder(
                builder: (context) => ChatPage5(
                  currentWallpaper: initialWallpaper,
                  updateWallpaperCallback: (wallpaper) {},
                ),
              ),
        },
      ),
    );
  }
}

class ChatMessage {
  final String content;
  final bool isUser;

  ChatMessage({required this.content, required this.isUser});
}

class ChatViewModel1 with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  void sendMessage(String message) {
    _messages.add(ChatMessage(content: message, isUser: true));
    _messages.add(ChatMessage(content: "Response to: $message", isUser: false));
    notifyListeners();
  }
}

class ChatViewModel2 with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  void sendMessage(String message) {
    _messages.add(ChatMessage(content: message, isUser: true));
    _messages.add(ChatMessage(content: "Response to: $message", isUser: false));
    notifyListeners();
  }
}

class ChatViewModel3 with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  void sendMessage(String message) {
    _messages.add(ChatMessage(content: message, isUser: true));
    _messages.add(ChatMessage(content: "Response to: $message", isUser: false));
    notifyListeners();
  }
}

class ChatViewModel4 with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  void sendMessage(String message) {
    _messages.add(ChatMessage(content: message, isUser: true));
    _messages.add(ChatMessage(content: "Response to: $message", isUser: false));
    notifyListeners();
  }
}

class ChatViewModel5 with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  void sendMessage(String message) {
    _messages.add(ChatMessage(content: message, isUser: true));
    _messages.add(ChatMessage(content: "Response to: $message", isUser: false));
    notifyListeners();
  }
}
