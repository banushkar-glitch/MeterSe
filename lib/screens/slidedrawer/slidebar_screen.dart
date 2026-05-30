import 'package:flutter/material.dart';
import '../profile_screen.dart';
import '../settings/settings_screen.dart';
import '../settings/logout/logoutsettings_screen.dart';
import '../slidedrawer/mytrips_screen.dart';
class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFE3C65A),
            ),
            accountName: const Text("Driver Name"),
            accountEmail: const Text("driver@email.com"),
            currentAccountPicture: const CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("My Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                   ProfileScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("My Trips"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MyTripsScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Driver Dashboard"),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SettingsScreen(),
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                   LogoutScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
