import 'package:flutter/material.dart';

import '../widget/widget.dart';

class StoragePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const StoragePage({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage Details'),
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: const [
              SizedBox(height: 30),

              // Pie
              AppSvg('pie'),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Availabe',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Total 128 GB',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(width: 36),
                  Text(
                    '43.36 GB',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 63),

              // Storage Tile
              AppStorageTile(
                color: Color(0xFF22215B),
                name: 'Design Files',
                size: '38.66 GB',
                percentage: 60,
              ),
              AppStorageTile(
                color: Color(0xFFFFC700),
                name: 'Images',
                size: '24.80 GB',
                percentage: 30,
              ),
              AppStorageTile(
                color: Color(0xFF4CE364),
                name: 'Video',
                size: '12.60 GB',
                percentage: 28,
              ),
              AppStorageTile(
                color: Color(0xFF567DF4),
                name: 'Documents',
                size: '06.57 GB',
                percentage: 80,
              ),
              AppStorageTile(
                color: Color(0xFFFF842B),
                name: 'Others',
                size: '2.01 GB',
                percentage: 20,
              ),

              SizedBox(height: 39),

              // Export
              Center(
                  child: Text(
                'Export Details',
                style: TextStyle(fontSize: 16),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
