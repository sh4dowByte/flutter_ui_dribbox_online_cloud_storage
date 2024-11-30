import 'package:flutter/material.dart';
import 'package:flutter_ui_dribbox_online_cloud_storage/config/pallete.dart';
import 'package:flutter_ui_dribbox_online_cloud_storage/widget/app_svg_icon.dart';

import '../config/routes.dart';
import '../widget/app_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -180,
            left: -190,
            child: AppSvg(
              'cloud',
              replaceColors: [
                ColorReplacement(
                    currentColor: 'EEF7FE',
                    replaceColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? '0A2A3E'
                            : 'EEF7FE'),
                ColorReplacement(
                    currentColor: 'DDEEFB',
                    replaceColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? '123D56'
                            : 'DDEEFB'),
              ],
              height: 700,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 20),
              child: ListView(
                children: [
                  const SizedBox(height: 80),
                  const Row(
                    children: [
                      AppSvg(
                        'cloud folder',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Welcome to',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Dirbbox',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Best cloud storage platform for all business and individuals to manage there data \n\nJoin For Free.',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Button
                  Row(
                    children: [
                      Flexible(
                        child: AppButton(
                          'Smart Id',
                          icon: const AppSvg(
                            'fingerprint',
                            height: 26,
                          ),
                          textColor: Pallete.primary,
                          transparancy: 0.1,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: AppButton(
                          'Sign In',
                          leadingIcon: const Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Colors.white,
                          ),
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.menu,
                            (Route<dynamic> route) => false,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 54),

                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const Text(
                          'Use Social Login',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 33),
                        // Social Icon
                        SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppSvgIcon(
                                'instagram',
                                color: Theme.of(context).iconTheme.color,
                              ),
                              AppSvgIcon(
                                'twitter',
                                color: Theme.of(context).iconTheme.color,
                              ),
                              AppSvgIcon(
                                'facebook',
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 53),
                        const Text('Create an account'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
