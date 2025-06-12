import 'package:chat_bot/wallpaper.dart';
import 'package:flutter/material.dart';


class HistoryPage extends StatefulWidget {
  final String currentWallpaper;
  HistoryPage({required this.currentWallpaper});
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('History')),
      body: BackgroundContainer(
        backgroundImage: widget.currentWallpaper,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Save my history ?",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(width: 200),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



