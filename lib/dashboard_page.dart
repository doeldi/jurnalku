import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/appbar.dart';
import 'package:jurnalku/widgets/info_card.dart';
import 'package:jurnalku/widgets/menu_item.dart';
import 'package:jurnalku/widgets/stat_card.dart';
import 'package:jurnalku/widgets/progress_akademik_card.dart';
import 'package:jurnalku/widgets/appdrawer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      drawer: const AppDrawer(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/dashboard.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Selamat Datang di Jurnalku',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                blurRadius: 4,
                                color: Colors.black54,
                                offset: Offset(0, 1))
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Solusi cerdas untuk memantau perkembangan kompetensi siswa secara efektif',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          shadows: [
                            Shadow(
                                blurRadius: 3,
                                color: Colors.black45,
                                offset: Offset(0, 1))
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff2565D8),
                      Color(0xFF1E3A8A),
                    ],
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Apa itu Jurnalku?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif, terstruktur, dan real-time. Dengan fitur lengkap, proses pemantauan menjadi lebih mudah dan transparan.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const InfoCard(
              icon: Icons.school_outlined,
              title: "Dirancang Khusus",
              description:
                  "Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.",
            ),
            const InfoCard(
              icon: Icons.access_time_outlined,
              title: "Efektif",
              description:
                  "Memudahkan siswa dan guru melihat perkembangan secara real-time.",
            ),
            const InfoCard(
              icon: Icons.bar_chart_outlined,
              title: "Terintegrasi",
              description:
                  "Pengajuan kompetensi siswa, validasi dan laporan perkembangan yang transparan.",
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "MENU APLIKASI",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    MenuItem(
                      icon: Icons.person_outline,
                      title: "Profil",
                      description: "Lihat dan kelola profilmu di sini.",
                      onTap: () {},
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    MenuItem(
                      icon: Icons.folder_open_outlined,
                      title: "Portofolio",
                      description:
                          "Lihat dan kelola portofolio kompetensimu di sini.",
                      onTap: () {},
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    MenuItem(
                      icon: Icons.workspace_premium_outlined,
                      title: "Sertifikat",
                      description:
                          "Lihat dan unduh sertifikat kompetensimu di sini.",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    MenuItem(
                      icon: Icons.book_outlined,
                      title: "Jurnal Pembiasaan",
                      description:
                          "Catat dan pantau kegiatan pembiasaan harianmu.",
                      onTap: () {},
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    MenuItem(
                      icon: Icons.group_add_outlined,
                      title: "Permintaan Saksi",
                      description:
                          "Lihat teman yang mengajukan permintaan saksi.",
                      onTap: () {},
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    MenuItem(
                      icon: Icons.insights_outlined,
                      title: "Progress",
                      description:
                          "Lihat kemajuan kompetensi dan penilaian belajarmu.",
                      onTap: () {},
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    MenuItem(
                      icon: Icons.warning_amber_outlined,
                      title: "Catatan Sikap",
                      description: "Lihat catatan sikap dan perilaku guru.",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "STATISTIK KOMPETENSI",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const StatCard(
              title: "Materi Diselesaikan",
              value: "1",
              label: "Selesai",
              icon: Icons.check_circle_outline,
              color: Colors.green,
            ),
            const StatCard(
              title: "Pengajuan Pending",
              value: "0",
              label: "Pending",
              icon: Icons.access_time_outlined,
              color: Colors.orange,
            ),
            const StatCard(
              title: "Materi Hari Ini",
              value: "0",
              label: "Hari Ini",
              icon: Icons.calendar_month_outlined,
              color: Colors.blue,
            ),
            const StatCard(
              title: "Materi Revisi",
              value: "0",
              label: "Revisi",
              icon: Icons.refresh_outlined,
              color: Colors.purple,
            ),
            const SizedBox(height: 20),
            const ProgressAkademikCard(),

            const SizedBox(height: 36),

            // === FOOTER ===
            Container(
              color: const Color(0xFF0D47A1),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Column(
                children: [
                  Text(
                    "© GEN-28 PPLG SMK Wikrama Bogor. All rights reserved.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
