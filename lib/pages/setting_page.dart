import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:term_project/pages/ProfilePage.dart';
import '../Provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings-page';
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late DatabaseReference referance =
      FirebaseDatabase.instance.ref().child(userid).child("settings");
  String userid = FirebaseAuth.instance.currentUser!.uid;

  static bool isSwitchedRecommender = false;
  static bool isSwitchedUpdate = false;
  static bool isSwitchedNotification = false;
  static bool isdarkTheme = false;

  var settings = <String, dynamic>{
    "recommender": isSwitchedRecommender,
    "update": isSwitchedUpdate,
    "notification": isSwitchedNotification,
    "darkTheme": isdarkTheme,
  };

  FutureBuilder readData() {
    return FutureBuilder(
      future: referance.once(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        } else if (snapshot.connectionState == ConnectionState.done) {
          try {
            final values = Map<String, dynamic>.from(
                snapshot.data!.snapshot.value as Map<dynamic, dynamic>);
            final themeProvider = Provider.of<ThemeProvider>(context);
            isSwitchedRecommender = values["recommender"];
            isSwitchedUpdate = values["update"];
            isSwitchedNotification = values["notification"];
            isdarkTheme = values["darkTheme"];
            return Expanded(
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
                          value: isSwitchedRecommender,
                          onChanged: ((value) {
                            setState(() {
                              isSwitchedRecommender = value;
                              referance.update({
                                "recommender": isSwitchedRecommender,
                              });
                            });
                          })),
                      onPressed: (context) {},
                      title: const Text("Recommender System"),
                      leading: const Icon(Icons.recommend_rounded),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(
                          activeColor: const Color.fromARGB(255, 255, 205, 55),
                          value: isSwitchedUpdate,
                          onChanged: ((value) {
                            setState(() {
                              isSwitchedUpdate = value;
                              referance.update({
                                "update": isSwitchedUpdate,
                              });
                            });
                          })),
                      onPressed: (context) {},
                      title: const Text("Offer Updates"),
                      leading: const Icon(Icons.cloud_download),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(
                          activeColor: const Color.fromARGB(255, 255, 205, 55),
                          value: isSwitchedNotification,
                          onChanged: ((value) {
                            setState(() {
                              isSwitchedNotification = value;
                              referance.update({
                                "notification": isSwitchedNotification,
                              });
                            });
                          })),
                      onPressed: (context) {},
                      title: const Text("Notifications"),
                      leading: const Icon(Icons.notifications),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(
                          activeColor: const Color.fromARGB(255, 255, 205, 55),
                          value: isdarkTheme,
                          onChanged: ((value) {
                            setState(() {
                              isdarkTheme = value;
                              referance.update({
                                "darkTheme": isdarkTheme,
                              });
                            });
                            themeProvider.toggleTheme();
                          })),
                      onPressed: (context) {},
                      title: const Text("Dark Theme"),
                      leading: Theme.of(context).brightness == Brightness.dark
                          ? Icon(Icons.dark_mode)
                          : Icon(Icons.sunny),
                    )
                  ],
                )
              ]),
            );
          } catch (e) {
            final themeProvider = Provider.of<ThemeProvider>(context);
            return Expanded(
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
                          value: isSwitchedRecommender,
                          onChanged: ((value) {
                            setState(() {
                              isSwitchedRecommender = value;
                              referance.update({
                                "recommender": isSwitchedRecommender,
                              });
                            });
                          })),
                      onPressed: (context) {},
                      title: const Text("Recommender System"),
                      leading: const Icon(Icons.recommend_rounded),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(
                          activeColor: const Color.fromARGB(255, 255, 205, 55),
                          value: isSwitchedUpdate,
                          onChanged: ((value) {
                            setState(() {
                              isSwitchedUpdate = value;
                              referance.update({
                                "update": isSwitchedUpdate,
                              });
                            });
                          })),
                      onPressed: (context) {},
                      title: const Text("Offer Updates"),
                      leading: const Icon(Icons.cloud_download),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(
                          activeColor: const Color.fromARGB(255, 255, 205, 55),
                          value: isSwitchedNotification,
                          onChanged: ((value) {
                            setState(() {
                              isSwitchedNotification = value;
                              referance.update({
                                "notification": isSwitchedNotification,
                              });
                            });
                          })),
                      onPressed: (context) {},
                      title: const Text("Notifications"),
                      leading: const Icon(Icons.notifications),
                    ),
                    SettingsTile.navigation(
                      trailing: Switch(
                          activeColor: const Color.fromARGB(255, 255, 205, 55),
                          value: isdarkTheme,
                          onChanged: ((value) {
                            setState(() {
                              isdarkTheme = value;
                              referance.update({
                                "darkTheme": isdarkTheme,
                              });
                              themeProvider.toggleTheme();
                            });
                          })),
                      onPressed: (context) {},
                      title: const Text("Dark Theme"),
                      leading: Theme.of(context).brightness == Brightness.dark
                          ? Icon(Icons.dark_mode)
                          : Icon(Icons.sunny),
                    )
                  ],
                )
              ]),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings),
        title: const Text("Settings"),
        backgroundColor: const Color.fromRGBO(53, 83, 88, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            readData(),
          ],
        ),
      ),
    );
  }
}
