import 'package:chat_bot/settings.dart';
import 'package:chat_bot/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'chatviewmodel3.dart';


class ChatPage3 extends StatefulWidget {
  final String currentWallpaper;
  final Function(String) updateWallpaperCallback;

  ChatPage3({required this.currentWallpaper, required this.updateWallpaperCallback});

  @override
  _ChatPage3State createState() => _ChatPage3State();
}

class _ChatPage3State extends State<ChatPage3> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatViewModel3 = Provider.of<generalwellnessnutrition>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('General Wellness Nutrition'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsPage(
                    updateWallpaperCallback: widget.updateWallpaperCallback,
                    currentWallpaper: widget.currentWallpaper,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: BackgroundContainer(
        backgroundImage: widget.currentWallpaper,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: chatViewModel3.messages.length,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      final message = chatViewModel3.messages[index];
                      return Align(
                        alignment:
                            message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            color: message.isUser ? Color(0xff2980b9) : Colors.grey[200],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: message.isUser ? Radius.circular(20) : Radius.circular(0),
                              bottomRight: message.isUser ? Radius.circular(0) : Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            message.content,
                            style: GoogleFonts.poppins(
                              color: message.isUser ? Colors.white : Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (chatViewModel3.messages.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          'Ask me anything about General Wellness Nutrition',
                          
                          textAlign: TextAlign.center,
                          style:
                          GoogleFonts.aBeeZee(
                           textStyle: TextStyle (
                            
                            fontSize: 25 ,
                            color: Colors.blue,
                          ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a message',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff2980b9),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        if (_controller.text.trim().isNotEmpty) {
                          chatViewModel3.sendMessage(_controller.text.trim());
                          _controller.clear();
                          _scrollToBottom();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

