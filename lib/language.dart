import 'package:chat_bot/wallpaper.dart';
import 'package:flutter/material.dart';


class LanguagePage extends StatefulWidget {
  final String currentWallpaper;
  LanguagePage({required this.currentWallpaper});
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLanguage = 'English';

  final List<String> languages = [
    'Afrikaans', 'Albanian', 'Amharic', 'Arabic', 'Armenian', 'Assamese', 'Azerbaijani',
    'Basque', 'Belarusian', 'Bengali', 'Bosnian', 'Bulgarian', 'Burmese',
    'Catalan', 'Cebuano', 'Chichewa', 'Chinese (Simplified)', 'Chinese (Traditional)', 'Corsican', 'Croatian', 'Czech',
    'Danish', 'Dhivehi', 'Dogri', 'Dutch',
    'English', 'Esperanto', 'Estonian', 'Ewe',
    'Faroese', 'Fijian', 'Filipino', 'Finnish', 'French', 'Frisian',
    'Galician', 'Georgian', 'German', 'Greek', 'Guarani', 'Gujarati',
    'Haitian Creole', 'Hausa', 'Hawaiian', 'Hebrew', 'Hindi', 'Hmong', 'Hungarian',
    'Icelandic', 'Igbo', 'Ilocano', 'Indonesian', 'Irish', 'Italian',
    'Japanese', 'Javanese',
    'Kannada', 'Kazakh', 'Khmer', 'Kinyarwanda', 'Konkani', 'Korean', 'Kurdish', 'Kyrgyz',
    'Lao', 'Latin', 'Latvian', 'Lithuanian', 'Luxembourgish',
    'Macedonian', 'Maithili', 'Malagasy', 'Malay', 'Malayalam', 'Maltese', 'Maori', 'Marathi', 'Mongolian', 'Myanmar (Burmese)',
    'Nepali', 'Norwegian', 'Nyanja',
    'Odia (Oriya)', 'Oromo',
    'Pashto', 'Persian', 'Polish', 'Portuguese', 'Punjabi',
    'Quechua',
    'Romanian', 'Russian',
    'Samoan', 'Sanskrit', 'Scots Gaelic', 'Serbian', 'Sesotho', 'Shona', 'Sindhi', 'Sinhala', 'Slovak', 'Slovenian', 'Somali', 'Spanish', 'Sundanese', 'Swahili', 'Swedish',
    'Tajik', 'Tamil', 'Tatar', 'Telugu', 'Thai', 'Tigrinya', 'Turkish', 'Turkmen',
    'Ukrainian', 'Urdu', 'Uyghur', 'Uzbek',
    'Vietnamese',
    'Welsh', 'Western Frisian',
    'Xhosa',
    'Yiddish', 'Yoruba',
    'Zulu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Language')),
      body: BackgroundContainer(
        backgroundImage: widget.currentWallpaper,
        child: ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            final lang = languages[index];
            final isSelected = lang == selectedLanguage;

            return ListTile(
              title: Text(lang),
              leading: Icon(
                isSelected ? Icons.check_circle : Icons.circle_outlined,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
              onTap: () {
                setState(() {
                  selectedLanguage = lang;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

