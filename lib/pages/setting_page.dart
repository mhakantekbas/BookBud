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
                          activeColor: const Color.fromARGB(255, 255, 205, 55),
                          value: isSwitched,
                          onChanged: ((value) {
                            setState(() {
                              isSwitched = value;
                            });
                          })),
                      onPressed: (context) {},
                      title: const Text("Recommender System"),
                      leading: const Icon(Icons.recommend_rounded),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(value: false, onChanged: ((value) {})),
                      onPressed: (context) {},
                      title: const Text("Comments"),
                      leading: const Icon(Icons.comment),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(value: false, onChanged: ((value) {})),
                      onPressed: (context) {},
                      title: const Text("Offer Updates"),
                      leading: const Icon(Icons.cloud_download),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(value: false, onChanged: ((value) {})),
                      onPressed: (context) {},
                      title: const Text("Notifications"),
                      leading: const Icon(Icons.notifications),
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
