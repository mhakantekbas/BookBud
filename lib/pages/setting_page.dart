import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import '../Provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings-page';
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitchedRecommender = false;
  bool isSwitchedUpdate = false;
  bool isSwitchedNotification = false;
  bool isdarkTheme = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: themeProvider.theme,
      home: Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.settings), title: const Text("Settings")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SettingsList(sections: [
                  SettingsSection(
                    title: const Text(
                      "Common",
                      style: TextStyle(color: Colors.black),
                    ),
                    tiles: [
                      SettingsTile.navigation(
                        trailing: Switch(
                            activeColor:
                                const Color.fromARGB(255, 255, 205, 55),
                            value: isSwitchedRecommender,
                            onChanged: ((value) {
                              setState(() {
                                isSwitchedRecommender = value;
                              });
                            })),
                        onPressed: (context) {},
                        title: const Text("Recommender System"),
                        leading: const Icon(Icons.recommend_rounded),
                      ),
                      SettingsTile.navigation(
                        trailing: Switch(
                            activeColor:
                                const Color.fromARGB(255, 255, 205, 55),
                            value: isSwitchedUpdate,
                            onChanged: ((value) {
                              setState(() {
                                isSwitchedUpdate = value;
                              });
                            })),
                        onPressed: (context) {},
                        title: const Text("Offer Updates"),
                        leading: const Icon(Icons.cloud_download),
                      ),
                      SettingsTile.navigation(
                        trailing: Switch(
                            activeColor:
                                const Color.fromARGB(255, 255, 205, 55),
                            value: isSwitchedNotification,
                            onChanged: ((value) {
                              setState(() {
                                isSwitchedNotification = value;
                              });
                            })),
                        onPressed: (context) {},
                        title: const Text("Notifications"),
                        leading: const Icon(Icons.notifications),
                      ),
                      SettingsTile.navigation(
                        trailing: Switch(
                            activeColor:
                                const Color.fromARGB(255, 255, 205, 55),
                            value: isdarkTheme,
                            onChanged: ((value) {
                              setState(() {
                                isdarkTheme = value;
                              });
                              themeProvider.toggleTheme();
                            })),
                        onPressed: (context) {},
                        title: const Text("Dark Theme"),
                        leading: const Icon(Icons.dark_mode),
                      )
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
