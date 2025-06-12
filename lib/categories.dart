import 'package:chat_bot/chatpage1.dart';
import 'package:chat_bot/chatpage2.dart';
import 'package:chat_bot/chatpage3.dart';
import 'package:chat_bot/chatpage4.dart';
import 'package:chat_bot/chatpage5.dart';
import 'package:chat_bot/wallpaper.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final Function(String) updateWallpaperCallback;
  final String currentWallpaper;

  CategoriesPage({
    required this.updateWallpaperCallback,
    required this.currentWallpaper,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.black87,
      ),
      body: BackgroundContainer(
        backgroundImage: currentWallpaper,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blueGrey),
                  backgroundColor: Colors.black,
                  minimumSize: Size(200, 80),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage1(
                        currentWallpaper: currentWallpaper,
                        updateWallpaperCallback: updateWallpaperCallback,
                      ),
                    ),
                  );
                },
                child: Text('Weight Management',
                style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blueGrey),
                  backgroundColor: Colors.black,
                  minimumSize: Size(200, 80),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage2(
                        currentWallpaper: currentWallpaper,
                        updateWallpaperCallback: updateWallpaperCallback,
                      ),
                    ),
                  );
                },
                child: Text('Chronic Disease Nutrition',
                style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blueGrey),
                  backgroundColor: Colors.black,
                  minimumSize: Size(200, 80),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage3(
                        currentWallpaper: currentWallpaper,
                        updateWallpaperCallback: updateWallpaperCallback,
                      ),
                    ),
                  );
                },
                child: Text('General Wellness Nutrition',
                style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blueGrey),
                  backgroundColor: Colors.black,
                  minimumSize: Size(200, 80),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage4(
                        currentWallpaper: currentWallpaper,
                        updateWallpaperCallback: updateWallpaperCallback,
                      ),
                    ),
                  );
                },
                child: Text('Pediatric & Geriatric Nutrition',
                style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blueGrey),
                  backgroundColor: Colors.black,
                  minimumSize: Size(200, 80),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage5(
                        currentWallpaper: currentWallpaper,
                        updateWallpaperCallback: updateWallpaperCallback,
                      ),
                    ),
                  );
                },
                child: Text('Sports & Performance Nutrition',
                style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
