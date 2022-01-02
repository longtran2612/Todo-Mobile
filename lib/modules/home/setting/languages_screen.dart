import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get.dart';
import 'package:todo/widgets/widgets.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  //languages
  final List locale = [
    {'name': 'Vietnamese', 'locale': const Locale('vi', 'VN')},
    {'name': 'English', 'locale': const Locale('en', 'US')},
    {'name': 'Japanese', 'locale': const Locale('jp', 'JP')},
  ];
  int languageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(title: 'chooselang'.tr),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: locale[0]['name'],
              trailing: trailingWidget(0),
              onPressed: (BuildContext context) {
                changeLanguage(locale[0]['locale'], 0);
              },
            ),
            SettingsTile(
              title: locale[1]['name'],
              trailing: trailingWidget(1),
              onPressed: (BuildContext context) {
                changeLanguage(locale[1]['locale'], 1);
              },
            ),
            SettingsTile(
              title: locale[2]['name'],
              trailing: trailingWidget(2),
              onPressed: (BuildContext context) {
                changeLanguage(locale[2]['locale'], 2);
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? Icon(Icons.check, color: Colors.blue)
        : Icon(null);
  }

  void changeLanguage(Locale locale, int index) {
    setState(() {
      languageIndex = index;
      Get.updateLocale(locale);
    });
  }
}
