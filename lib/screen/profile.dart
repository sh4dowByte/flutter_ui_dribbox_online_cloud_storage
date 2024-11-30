import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../widget/widget.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProfilePage({super.key, required this.scaffoldKey});

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
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
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
            children: [
              const SizedBox(height: 30),

              // User Card
              Container(
                height: 209,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 24,
                      right: 30,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF317B),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'PRO',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  color: const Color(0xFFF1F3F6),
                                  child: Image.asset('assets/person.png'),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Neelesh Chaudhary',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'UI / UX Designer',
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare pretium placerat ut platea.',
                                style: Theme.of(context).textTheme.labelMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Folder
              FolderComponent(items: items),

              const SizedBox(height: 30),

              // Recent Uploads
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Recent Uploads'),
                  AppSvgIcon(
                    'sort',
                    height: 10,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ],
              ),

              // File tile
              AppFileTile(
                icon: AppIcons8.getById('vCmmOWVBAcll'),
                name: 'Projects.docx',
                date: 'Novemaber 22.2020',
                size: '300kb',
                color: Colors.blue,
              ),
              // File tile
              AppFileTile(
                icon: AppIcons8.getById('13654'),
                name: 'Timeline.xlsx',
                date: 'Novemaber 22.2021',
                size: '340kb',
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FolderComponent extends StatefulWidget {
  const FolderComponent({
    super.key,
    required this.items,
  });
  final List<Map<String, dynamic>> items;

  @override
  State<FolderComponent> createState() => _FolderComponentState();
}

class _FolderComponentState extends State<FolderComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  late Animation<Offset> _shakeOffset;

  bool isEdit = false;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    // Membuat animasi shake dengan rotasi dan offset (horizontal)
    _shakeAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _shakeOffset =
        Tween<Offset>(begin: const Offset(-0.3, 0), end: const Offset(0.3, 0))
            .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _startShake() {
    if (!isEdit) {
      // Mulai animasi shake infinite
      _controller.repeat(reverse: true);
      setState(() {
        isEdit = true;
      });
    }
  }

  void _stopShake() {
    if (isEdit) {
      // Hentikan animasi shake dan reset transformasi
      _controller.stop();
      setState(() {
        isEdit = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // My Folders
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('My Folders'),
            Row(
              children: [
                AppSvgIcon(
                  'add',
                  height: 10,
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    if (isEdit) {
                      _stopShake(); // Jika sedang goyang, hentikan shake
                    } else {
                      _startShake(); // Mulai shake jika tidak goyang
                    }
                  },
                  child: AppSvgIcon(
                    'settings',
                    height: 10,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ],
            ),
          ],
        ),

        const SizedBox(height: 30),
        IgnorePointer(
          ignoring: !isEdit,
          child: ReorderableGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.4,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                final element = widget.items.removeAt(oldIndex);
                widget.items.insert(newIndex, element);
              });
            },
            dragWidgetBuilder: (index, child) {
              return Transform.scale(
                scale: 1.1, // Perbesar widget saat diseret
                child: Opacity(
                  opacity: 0.9, // Kurangi opacity untuk efek drag
                  child: child,
                ),
              );
            },
            dragStartDelay: const Duration(microseconds: 0),
            children: widget.items
                .map((item) => AnimatedBuilder(
                      key: ValueKey(item['name']),
                      animation: _controller,
                      builder: (context, child) {
                        // Hanya terapkan transformasi saat shake sedang aktif
                        if (isEdit) {
                          // Goyang kiri-kanan dengan rotasi dan offset
                          return Transform.translate(
                            offset: _shakeOffset.value,
                            child: Transform.rotate(
                              angle: _shakeAnimation.value, // Rotasi untuk efek
                              child: child,
                            ),
                          );
                        } else {
                          // Tidak ada transformasi saat shake tidak aktif
                          return child!;
                        }
                      },
                      child: AppFolderCard(
                          name: item['name'],
                          date: item['date'],
                          secondaryColor: item['secondary_color'],
                          primaryColor: item['primary_color']),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
