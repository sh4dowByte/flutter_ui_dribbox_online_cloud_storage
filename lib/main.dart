import 'package:flutter/material.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_dribbox_online_cloud_storage/widget/app_icons8.dart';

import 'config/routes.dart';
import 'screen/screen.dart';
import 'config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void _updateStatusBar() {
    final isDark = themeMode == ThemeMode.dark;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark, // Ikon
        systemNavigationBarColor:
            isDark ? Colors.black : Colors.white, // Warna navigasi
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark, // Ikon navigasi
        statusBarBrightness:
            isDark ? Brightness.dark : Brightness.light, // Untuk perangkat iOS
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dribbox Online Cloud Storage',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      builder: (context, child) {
        return Stack(
          children: [
            FloatingDraggableWidget(
              autoAlign: true,
              dx: 1,
              dy: 70,
              floatingWidget: GestureDetector(
                onTap: () {
                  setState(() {
                    themeMode = themeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark;
                  });
                  _updateStatusBar();
                },
                child: AppIcons8.getById(
                    themeMode == ThemeMode.dark ? '33118' : '21106',
                    fit: BoxFit.cover,
                    width: 10,
                    height: 20),
              ),
              floatingWidgetWidth: 40,
              floatingWidgetHeight: 40,
              mainScreenWidget: child!,
            ),
          ],
        );
      },
      home: const LoginPage(),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
