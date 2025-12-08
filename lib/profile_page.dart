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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const CustomAppBar(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      drawer: const AppDrawer(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ==== BAGIAN ATAS (HEADER) ====
            Stack(
              clipBehavior: Clip.none,
              children: [
                // HEADER BG
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Banner-Web.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // TOMBOL BACK
                Positioned(
                  top: 20,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                // CARD PUTIH + TAB
                Positioned(
                  top: 180,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                      top: 40 + 8,
                      left: 16,
                      right: 16,
                      bottom: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Abdul Hadi",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "12309480 | PPLG XII-4 | Cic 3",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1E3A8A),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.share,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _tabItem(
                              title: "Overview",
                              index: 0,
                              selectedIndex: selectedTabIndex,
                              onTap: () {
                                setState(() {
                                  selectedTabIndex = 0;
                                });
                              },
                            ),
                            const SizedBox(width: 16),
                            _tabItem(
                              title: "Portfolio",
                              index: 1,
                              selectedIndex: selectedTabIndex,
                              onTap: () {
                                setState(() {
                                  selectedTabIndex = 1;
                                });
                              },
                            ),
                            const SizedBox(width: 16),
                            _tabItem(
                              title: "Sertifikat",
                              index: 2,
                              selectedIndex: selectedTabIndex,
                              onTap: () {
                                setState(() {
                                  selectedTabIndex = 2;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // FOTO PROFIL
                Positioned(
                  bottom: -30,
                  left: 24,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 37,
                          backgroundImage:
                              AssetImage("assets/images/default-profile.jpg"),
                        ),
                      ),
                      Positioned(
                        bottom: -2,
                        right: -2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E3A8A),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          padding: const EdgeInsets.all(3),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 180),

            if (selectedTabIndex == 0) ...[
              _sectionHeader("Portfolio Terbaru"),
              _sectionCardContent(
                title: "Portfolio Terbaru",
                icon: Icons.work_outline,
              ),
              const SizedBox(height: 20),
              _sectionHeader("Sertifikat Terbaru"),
              _sectionCardContent(
                title: "Sertifikat Terbaru",
                icon: Icons.emoji_events_outlined,
              ),
              const SizedBox(height: 24),
              _bigSectionContainer(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ringkasan",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Ini adalah ringkasan singkat tentang profil dan aktivitas kamu.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ] else if (selectedTabIndex == 1) ...[
              // ===== TAB PORTFOLIO =====
              _sectionHeader("Semua Portfolio"),
              _sectionCardContent(
                title: "Daftar Portfolio",
                icon: Icons.work_outline,
              ),
              const SizedBox(height: 16),
              _bigSectionContainer(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Statistik Portfolio",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Jumlah project: 5\nProject aktif: 2\nProject selesai: 3",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ] else if (selectedTabIndex == 2) ...[
              // ===== TAB SERTIFIKAT =====
              _sectionHeader("Semua Sertifikat"),
              _sectionCardContent(
                title: "Daftar Sertifikat",
                icon: Icons.emoji_events_outlined,
              ),
              const SizedBox(height: 16),
              _bigSectionContainer(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ringkasan Sertifikat",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Total sertifikat: 8\nSertifikat teknikal: 5\nSertifikat non-teknikal: 3",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            _bigSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dokumen",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _documentItem(
                    title: "Curriculum Vitae",
                    subtitle: "Dokumen CV siswa",
                    buttonColor: const Color(0xFF1459D2),
                    buttonText: "Lihat CV",
                    icon: Icons.file_download_outlined,
                  ),
                  const Divider(height: 32),
                  _documentItem(
                    title: "Kartu Pelajar",
                    subtitle: "Kartu identitas siswa",
                    buttonColor: const Color(0xFF1E9C42),
                    buttonText: "Lihat Kartu Pelajar",
                    icon: Icons.file_download_outlined,
                    extraNote: "Kartu pelajar dapat dilihat oleh anda dan guru",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ============ MEDIA SOSIAL ============
            _bigSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Media Sosial",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit_outlined,
                          size: 16,
                        ),
                        label: const Text(
                          "Edit",
                          style: TextStyle(fontSize: 12),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          minimumSize: Size.zero,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _socialItem(
                    title: "Instagram",
                    url: "https://www.instagram.com/doel.hadii/",
                  ),
                  const SizedBox(height: 12),
                  _socialItem(
                    title: "Linkedin",
                    url: "https://www.linkedin.com/in/doelhadi/",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ================== WIDGET HELPER ==================

  static Widget _tabItem({
    required String title,
    required int index,
    required int selectedIndex,
    required VoidCallback onTap,
  }) {
    final bool active = index == selectedIndex;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: active ? Color(0xFF1E3A8A) : Colors.grey.shade600,
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 60,
            color: active ? Color(0xFF1E3A8A) : Colors.transparent,
          ),
        ],
      ),
    );
  }

  static Widget _sectionCardContent({
    required IconData icon,
    required String title,
  }) {
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

  static Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: const Text(
                  "Tambah",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "|",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Lihat Semua", style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ],
    );
  }

  static Widget _bigSectionContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  static Widget _documentItem({
    required String title,
    required String subtitle,
    required Color buttonColor,
    required String buttonText,
    required IconData icon,
    String? extraNote,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined, size: 18),
                  label: Text(
                    buttonText,
                    style: const TextStyle(fontSize: 13),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(icon, size: 20),
            ),
          ],
        ),
        if (extraNote != null) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                size: 14,
                color: Colors.orange,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  extraNote,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  static Widget _socialItem({
    required String title,
    required String url,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.link, size: 18, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                url,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF1E3A8A),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Icon(
          Icons.open_in_new,
          size: 16,
          color: Colors.grey.shade500,
        ),
      ],
    );
  }
}
