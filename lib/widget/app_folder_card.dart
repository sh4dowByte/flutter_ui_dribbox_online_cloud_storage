import 'package:flutter/material.dart';
import 'package:flutter_ui_dribbox_online_cloud_storage/widget/widget.dart';

import '../utils/color.dart';

class AppFolderCard extends StatelessWidget {
  const AppFolderCard({
    super.key,
    required this.secondaryColor,
    required this.primaryColor,
    required this.name,
    required this.date,
  });

  final String name;
  final String date;
  final String secondaryColor;
  final String primaryColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        height: 5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: hexToColor(secondaryColor).withOpacity(0.07),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppSvg(
                  'folder',
                  height: 28,
                  replaceColors: [
                    ColorReplacement(
                        currentColor: 'F45656', replaceColor: secondaryColor),
                    ColorReplacement(
                        currentColor: 'AC4141', replaceColor: primaryColor),
                  ],
                ),
                Icon(Icons.more_vert_rounded, color: hexToColor(primaryColor))
              ],
            ),
            const SizedBox(height: 14),
            Text(
              name,
              style: TextStyle(
                  fontSize: 15,
                  color: hexToColor(primaryColor),
                  fontWeight: FontWeight.normal),
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 10,
                color: hexToColor(primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
