import 'package:chat_bot/wallpaper.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final Function(String) updateWallpaperCallback;
  final String currentWallpaper;
  SettingsPage({required this.updateWallpaperCallback, required this.currentWallpaper});

  final List<String> settingsOptions = [
    'History',
    'Language',
    'Customize Chatbot',
    'Terms and Conditions',
    'Themes and Wallpapers',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Settings')),
      body: BackgroundContainer(
        backgroundImage: currentWallpaper,
        child: ListView.builder(
          itemCount: settingsOptions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                settingsOptions[index],
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                switch (settingsOptions[index]) {
                  case 'History':
                    Navigator.pushNamed(context, '/history');
                    break;
                  case 'Language':
                    Navigator.pushNamed(context, '/language');
                    break;
                  case 'Customize Chatbot':
                    Navigator.pushNamed(context, '/customize');
                    break;
                  case 'Terms and Conditions':
                    Navigator.pushNamed(context, '/terms');
                    break;
                  case 'Themes and Wallpapers':
                    Navigator.pushNamed(context, '/themes');
                    break;
                  case 'Logout':
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); 
                              },
                              child: Text('Cancel',
                              style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); 
                                Navigator.popUntil(context, (route) => route.isFirst);
                              },
                              child: Text('Logout',
                              style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                    break;
                }
              },
            );
          },
        ),
      ),
    );
  }
}
