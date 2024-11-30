import 'package:flutter/material.dart';

import '../widget/widget.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'id': 1,
        'name': 'Mobile Apps',
        'date': 'December 20.2020',
        'primary_color': '415EB6',
        'secondary_color': '567DF4'
      },
      {
        'id': 2,
        'name': 'SVG Icons',
        'date': 'December 14.2020',
        'primary_color': 'FFB110',
        'secondary_color': 'FFDE6C'
      },
      {
        'id': 3,
        'name': 'Prototypes',
        'date': 'Novemaber 22.2020',
        'primary_color': 'AC4141',
        'secondary_color': 'F45656'
      },
      {
        'id': 4,
        'name': 'Avatars',
        'date': 'Novemaber 10.2020',
        'primary_color': '23B0B0',
        'secondary_color': '34DEDE'
      },
      {
        'id': 5,
        'name': 'Design',
        'date': 'December 20.2020',
        'primary_color': '415EB6',
        'secondary_color': '567DF4'
      },
      {
        'id': 6,
        'name': 'Portofolio',
        'date': 'December 14.2020',
        'primary_color': 'FFB110',
        'secondary_color': 'FFDE6C'
      },
      {
        'id': 7,
        'name': 'References',
        'date': 'Novemaber 22.2020',
        'primary_color': 'AC4141',
        'secondary_color': 'F45656'
      },
      {
        'id': 8,
        'name': 'Client',
        'date': 'Novemaber 10.2020',
        'primary_color': '23B0B0',
        'secondary_color': '34DEDE'
      },
      {
        'id': 9,
        'name': 'Mobile Apps',
        'date': 'December 20.2020',
        'primary_color': '415EB6',
        'secondary_color': '567DF4'
      },
      {
        'id': 10,
        'name': 'SVG Icons',
        'date': 'December 14.2020',
        'primary_color': 'FFB110',
        'secondary_color': 'FFDE6C'
      },
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90), // Sudut melengkung
        ),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your Dribbbox',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    icon: AppSvgIcon(
                      'menu',
                      color: Theme.of(context).iconTheme.color!,
                      height: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Search input
              const AppTextSearch(
                hintText: 'Search Folder',
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AppSvgIcon(
                    'search',
                    height: 20,
                    width: 20,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Recent
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text('Recent'),
                      SizedBox(width: 6),
                      Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                  Row(
                    children: [
                      AppSvgIcon(
                        'list',
                        color: Theme.of(context).iconTheme.color,
                        height: 16,
                      ),
                      const SizedBox(width: 20),
                      AppSvgIcon(
                        'grid',
                        color: Theme.of(context).iconTheme.color,
                        height: 16,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),
              // Folder
              Expanded(
                child: ListView(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.4,
                      ),
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return AppFolderCard(
                            name: item['name'],
                            date: item['date'],
                            secondaryColor: item['secondary_color'],
                            primaryColor: item['primary_color']);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
