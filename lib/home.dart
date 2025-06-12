import 'package:chat_bot/wallpaper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String currentWallpaper;
  const HomePage({required this.currentWallpaper, required Null Function(dynamic value) updateWallpaperCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundContainer(
        backgroundImage: currentWallpaper,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 300, bottom: 180),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/categories'),
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'ChatAi',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blueGrey),
                  backgroundColor: Colors.black,
                  minimumSize: Size(200, 50),
                ),
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blueGrey),
                  backgroundColor: Colors.black,
                  minimumSize: Size(220, 50),
                ),
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 200)
            ],
          ),
        ),
      ),
    );
  }
}
