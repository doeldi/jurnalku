import 'package:flutter/material.dart';
import 'package:jurnalku/jurnal_page.dart';
import 'package:jurnalku/login.dart';
import 'package:jurnalku/explore_page.dart';
import 'package:jurnalku/permintaan_saksi.dart';
import 'package:jurnalku/profile_page.dart';
import 'package:jurnalku/progres_page.dart';
import 'package:jurnalku/panduan_page.dart';
import 'package:jurnalku/setting_screen.dart';
import '../dashboard_page.dart';
import 'package:jurnalku/catatan_sikap.dart';

class AppDrawer extends StatelessWidget {
  final String name;
  final String kelas;

  const AppDrawer({super.key, required this.name, required this.kelas});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF1E3A8A)),
            accountName: Text(name),
            accountEmail: Text("Kelas $kelas"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/default-profile.jpg'),
            ),
          ),
          _drawerItem(Icons.dashboard_outlined, "Dashboard", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const DashboardPage()));
          }),
          _drawerItem(Icons.person_outline, "Profil", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProfilePage()));
          }),
          _drawerItem(Icons.travel_explore_outlined, "Jelajahi", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ExplorePage()));
          }),
          const Divider(),
          _drawerItem(Icons.book_outlined, "Jurnal", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => JurnalPage()));
          }),
          _drawerItem(Icons.assignment_ind_outlined, "Permintaan Saksi", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const PermintaanSaksiPage()));
          }),
          _drawerItem(Icons.insights_outlined, "Progress", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProgressBelajarPage()));
          }),
          //Catatan Sikap
          _drawerItem(Icons.note_alt_outlined, "Catatan Sikap", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const CatatanSikap()));
          }),
          const Divider(),
          _drawerItem(Icons.help_outline, "Panduan Penggunaan", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const PanduanPage()));
          }),
          _drawerItem(Icons.settings, "Pengaturan Akun", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SettingScreen()));
          }),
          _drawerItem(Icons.logout, "Logout", () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const Login()));
          }),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback tap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: tap,
    );
  }
}
