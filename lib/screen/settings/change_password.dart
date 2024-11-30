import 'package:flutter/material.dart';
import 'package:flutter_ui_dribbox_online_cloud_storage/widget/app_text_input.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        children: const [
          Text(
            'Change Password',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          AppTextInput(
            hintText: 'Current Password',
          ),
          SizedBox(height: 30),
          AppTextInput(
            hintText: 'New Password',
          ),
          SizedBox(height: 30),
          AppTextInput(
            hintText: 'Confirm new password',
          ),
        ],
      ),
    );
  }
}
