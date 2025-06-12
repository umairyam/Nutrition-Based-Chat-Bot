import 'package:chat_bot/chatviewmodel2.dart';
import 'package:chat_bot/settings.dart';
import 'package:chat_bot/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class ChatPage2 extends StatefulWidget {
  final String currentWallpaper;
  final Function(String) updateWallpaperCallback;

  ChatPage2({required this.currentWallpaper, required this.updateWallpaperCallback});

  @override
  _ChatPage2State createState() => _ChatPage2State();
}

class _ChatPage2State extends State<ChatPage2> {
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
    final chatviewmodel2 = Provider.of<ChronicViewModel>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chronic Disease Nutrition'),
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
                    itemCount: chatviewmodel2.messages.length,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      final message = chatviewmodel2.messages[index];
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
                  if (chatviewmodel2.messages.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          'Ask me anything about   Chronic Disease Nutrition',
                          
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
                          chatviewmodel2.sendMessage(_controller.text.trim());
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

