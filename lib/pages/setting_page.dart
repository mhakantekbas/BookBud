import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings-page';
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.settings), title: Text("Settings")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SettingsList(sections: [
                SettingsSection(
                  title: Text(
                    "Common",
                    style: TextStyle(color: Colors.black),
                  ),
                  tiles: [
                    SettingsTile.navigation(
                      trailing: Switch(
                          activeColor: Color.fromARGB(255, 255, 205, 55),
                          value: isSwitched,
                          onChanged: ((value) {
                            setState(() {
                              isSwitched = value;
                            });
                          })),
                      onPressed: (context) {},
                      title: Text("Recommender System"),
                      leading: Icon(Icons.recommend_rounded),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(value: false, onChanged: ((value) {})),
                      onPressed: (context) {},
                      title: Text("Comments"),
                      leading: Icon(Icons.comment),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(value: false, onChanged: ((value) {})),
                      onPressed: (context) {},
                      title: Text("Offer Updates"),
                      leading: Icon(Icons.cloud_download),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(value: false, onChanged: ((value) {})),
                      onPressed: (context) {},
                      title: Text("Notifications"),
                      leading: Icon(Icons.notifications),
                    )
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
