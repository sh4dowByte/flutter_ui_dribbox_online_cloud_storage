import 'package:flutter/material.dart';
import 'package:flutter_ui_dribbox_online_cloud_storage/config/routes.dart';

import '../widget/widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: AppSvgIcon(
                  'menu',
                  color: Theme.of(context).iconTheme.color!,
                  height: 18,
                )),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          const AppSettingsTile(name: 'Add Account'),
          AppSettingsTile(
            name: 'Change Password',
            onTap: () => Navigator.pushNamed(context, Routes.changePassword),
          ),
          const AppSettingsTile(name: 'Change Language'),
          const AppSettingsTile(name: 'Upgrade Plan'),
          const AppSettingsTile(name: 'Multiple Account'),

          const SizedBox(height: 50),
          // Enabled
          const AppSettingsTileToggle(name: 'Enabled Sync'),
          const AppSettingsTileToggle(name: 'Enable 2 Step Verification')
        ],
      ),
    );
  }
}

class AppSettingsTileToggle extends StatefulWidget {
  const AppSettingsTileToggle({super.key, required this.name});
  final String name;

  @override
  State<AppSettingsTileToggle> createState() => _AppSettingsTileToggleState();
}

class _AppSettingsTileToggleState extends State<AppSettingsTileToggle> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class AppSettingsTile extends StatelessWidget {
  const AppSettingsTile({
    super.key,
    this.onTap,
    required this.name,
  });
  final Function()? onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: Text(
          name,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
