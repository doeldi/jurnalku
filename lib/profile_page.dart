import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/appbar.dart';
import 'package:jurnalku/widgets/appdrawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTabIndex = 0;

  final List<Map<String, dynamic>> dummyPortfolio = [
    {"title": "Website Portofolio", "desc": "Project pribadi menggunakan Flutter Web"},
    {"title": "Aplikasi Kasir", "desc": "Menggunakan Laravel + MySQL"},
    {"title": "Landing Page UMKM", "desc": "UI modern untuk klien lokal"}
  ];

  final List<Map<String, dynamic>> dummyCertificates = [
    {"title": "Dicoding Flutter", "desc": "Sertifikat kelulusan kelas Flutter"},
    {"title": "Google UI/UX", "desc": "Dasar rancangan antarmuka"},
    {"title": "Progate Laravel", "desc": "Dasar backend Laravel"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const CustomAppBar(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      drawer: const AppDrawer(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profileCard(),
            const SizedBox(height: 60),
            _tabs(),
            const SizedBox(height: 10),
            _buildTabContent(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ============================
  //      PROFILE HEADER
  // ============================
  Widget _profileCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Banner-Web.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Back Button
        Positioned(
          top: 20,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),

        // CONTENT BOX
        Positioned(
          top: 140,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abdul Hadi",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(height: 4),
                          Text(
                            "12309480 | PPLG XII-4 | Cic 3",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF1E3A8A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.share, color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),

        // PROFILE AVATAR
        Positioned(
          top: 100,
          left: 24,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 37,
                  backgroundImage: AssetImage("assets/images/default-profile.jpg"),
                ),
              ),

              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E3A8A),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  // ============================
  //            TABS
  // ============================
  Widget _tabs() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          _tabItem("Overview", 0),
          _tabItem("Portfolio", 1),
          _tabItem("Sertifikat", 2),
        ],
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    bool active = selectedTabIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => setState(() => selectedTabIndex = index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: active ? Color(0xFF1E3A8A) : Colors.grey,
                  fontWeight: active ? FontWeight.w700 : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 2,
                width: 60,
                color: active ? const Color(0xFF1E3A8A) : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTabIndex) {
      case 1:
        return _portfolioTab();
      case 2:
        return _certificateTab();
      default:
        return _overviewTab();
    }
  }

  // ============================
  //         TAB CONTENT
  // ============================

  Widget _overviewTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeaderWithActions("Portfolio Terbaru"),
        _sectionCardContent(
          title: "Portfolio Terbaru",
          icon: Icons.work_outline,
        ),
        const SizedBox(height: 20),
        _sectionHeaderWithActions("Sertifikat Terbaru"),
        _sectionCardContent(
          title: "Sertifikat Terbaru",
          icon: Icons.emoji_events_outlined,
        ),
        const SizedBox(height: 20),
        _section("Ringkasan",
            const Text("Ini adalah ringkasan singkat tentang profil dan aktivitas kamu.")),
        _section(
          "Dokumen",
          Column(
            children: [
              _documentItem(
                  title: "Curriculum Vitae",
                  subtitle: "Dokumen CV siswa",
                  buttonText: "Lihat CV",
                  color: const Color(0xFF1459D2)),
              const SizedBox(height: 12),
              _documentItem(
                  title: "Kartu Pelajar",
                  subtitle: "Kartu identitas siswa",
                  buttonText: "Lihat Kartu Pelajar",
                  color: const Color(0xFF1E9C42)),
            ],
          ),
        ),
        _section(
          "Media Sosial",
          Column(
            children: [
              _socialItem("Instagram", "https://www.instagram.com/doel.hadii/"),
              const SizedBox(height: 12),
              _socialItem("Linkedin", "https://www.linkedin.com/in/doelhadi/"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _portfolioTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A8A),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Tambah Portofolio", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
        ...dummyPortfolio.map((p) => _listItem(p["title"], p["desc"])),
      ],
    );
  }

  Widget _certificateTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A8A),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Tambah Sertifikat", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
        ...dummyCertificates.map((c) => _listItem(c["title"], c["desc"])),
      ],
    );
  }

  // ============================
  //        REUSABLE UI
  // ============================

  Widget _section(String title, Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          child
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 0, 10),
      child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }

  Widget _sectionHeaderWithActions(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Text("Tambah", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                ),
              ),
              const SizedBox(width: 8),
              Text("|", style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
              TextButton(
                onPressed: () {},
                child: const Text("Lihat Semua", style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _listItem(String title, String desc) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          const Icon(Icons.folder_outlined, size: 32, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(desc,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _documentItem({
    required String title,
    required String subtitle,
    required String buttonText,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        Text(subtitle,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color),
            onPressed: () {},
            child: Text(buttonText, style: const TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }

  Widget _socialItem(String title, String url) {
    return Row(
      children: [
        const Icon(Icons.link, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(url,
                  style: const TextStyle(color: Color(0xFF1E3A8A), fontSize: 12)),
            ],
          ),
        ),
        const Icon(Icons.open_in_new, size: 16),
      ],
    );
  }

  Widget _sectionCardContent({required String title, required IconData icon}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Icon(icon, size: 40, color: Colors.grey.shade400),
          const SizedBox(height: 30),
          Text(
            "$title akan ditampilkan di sini",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
