import 'package:flutter/material.dart';
import 'package:chat_bot/wallpaper.dart';


class CustomizeChatbotPage extends StatelessWidget {
  final String currentWallpaper;
  CustomizeChatbotPage({required this.currentWallpaper});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Customize Chatbot')),
      body: BackgroundContainer(
        backgroundImage: currentWallpaper,
        child:Column(
          children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Introduce yourself to get better, more personalized responses!",
            style: TextStyle(
              fontSize: 20
            ),
            ),
                ),
        SizedBox(height: 20),
            Text(
            "What do you want from ChatAi to call you?",
            style: TextStyle(
              fontSize: 14.5
            ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Nickname',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
            ),
            Text(
            ""
            ),
        ],
        ),
      ),
    );
  }
}


