import 'package:chat_bot/wallpaper.dart';
import 'package:flutter/material.dart';



class ThemesPage extends StatefulWidget {
  final Function(String) onWallpaperSelected;
  final String currentWallpaper;
  ThemesPage({required this.onWallpaperSelected, required this.currentWallpaper});

  @override
  _ThemesPageState createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  String? _selectedWallpaper;

  final List<String> _wallpaperAssets = [
    'assets/daek aquatic color (3).jpg',
    'assets/HD-wallpaper-blueorange.jpeg',
    'assets/HD-wallpaper-butterfly.jpg',
    'assets/HD-wallpaper-nice-neon-blue.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _selectedWallpaper = widget.currentWallpaper;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Themes and Wallpapers'),
      ),
      body: BackgroundContainer(
        backgroundImage: widget.currentWallpaper,
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _wallpaperAssets.length,
          itemBuilder: (context, index) {
            final asset = _wallpaperAssets[index];
            final isSelected = asset == _selectedWallpaper;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedWallpaper = asset;
                  widget.onWallpaperSelected(asset);
                });
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(asset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.6),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}