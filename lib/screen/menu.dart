import 'package:flutter/material.dart';
import 'package:flutter_ui_dribbox_online_cloud_storage/config/routes.dart';
import 'screen.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedIndex = 0; // Variabel untuk melacak menu yang dipilih
  // GlobalKey untuk mengontrol Drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
// Daftar menu untuk ditampilkan di layar
    List<Widget> menuItems = [
      HomePage(
        scaffoldKey: _scaffoldKey,
      ),
      ProfilePage(
        scaffoldKey: _scaffoldKey,
      ),
      StoragePage(
        scaffoldKey: _scaffoldKey,
      ),
      const Center(child: Text('Shared')),
      const Center(child: Text('Stat')),
      SettingsPage(
        scaffoldKey: _scaffoldKey,
      ),
      const Center(child: Text('Help')),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        // width: MediaQuery.of(context).size.width, // Lebar drawer penuh
        child: CustomFullScreenDrawer(
          selectedIndex: selectedIndex,
          onItemTapped: (index) {
            setState(() {
              selectedIndex = index;
            });
            Navigator.pop(context); // Tutup drawer setelah memilih menu
          },
        ),
      ),
      body: menuItems[selectedIndex],
    );
  }
}

class CustomFullScreenDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomFullScreenDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFF1F3F6)
          : Theme.of(context)
              .scaffoldBackgroundColor, // Warna latar belakang drawer
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Drawer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 210,
                height: 150,
                padding: const EdgeInsets.all(16.0).copyWith(top: 70),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(60))),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/person.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Neelesh',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Seattle,Washington',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0).copyWith(top: 37),
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero, // Hilangkan padding bawaan
              children: [
                const SizedBox(height: 108),

                _buildMenuItem(context, 0, Icons.home, 'Home'),
                _buildMenuItem(context, 1, Icons.settings, 'Profile'),
                _buildMenuItem(context, 2, Icons.logout, 'Storage'),
                _buildMenuItem(context, 3, Icons.logout, 'Shared'),
                _buildMenuItem(context, 4, Icons.logout, 'Stat'),
                _buildMenuItem(context, 5, Icons.logout, 'Settings'),
                _buildMenuItem(context, 6, Icons.logout, 'Help'),

                // Logout
                const SizedBox(height: 86),
                GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.login,
                    (Route<dynamic> route) => false,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // logout
                        Row(
                          children: [
                            Icon(Icons.power_settings_new_rounded),
                            SizedBox(width: 8),
                            Text('Logout'),
                          ],
                        ),
                        SizedBox(height: 62),

                        // Version
                        Text(
                          'Version 2.0.1',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    int index,
    IconData icon,
    String title,
  ) {
    // Mengecek apakah menu ini dipilih
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        if ([0, 1, 2, 5].contains(index)) {
          onItemTapped(index);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 23),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 33,
              decoration: BoxDecoration(
                  color:
                      isSelected ? Colors.blue : Colors.white.withOpacity(0)),
            ),
            const SizedBox(width: 26),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal, // Menebalkan teks jika dipilih
              ),
            )
          ],
        ),
      ),
    );
  }
}
