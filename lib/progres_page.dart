import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/appbar.dart';
import 'package:jurnalku/widgets/appdrawer.dart';

class ProgressBelajarPage extends StatelessWidget {
  const ProgressBelajarPage({Key? key}) : super(key: key);

  // Dummy data kompetensi setiap project
  final List<Map<String, dynamic>> dummyKompetensi = const [
    {
      "judul": "Membuat Aplikasi CRUD",
      "guru": "Pak Rudi",
      "tanggal": "22 Nov 2025",
      "status": "Lulus",
      "catatanGuru": "Sangat baik, fitur lengkap.",
      "catatanSiswa": "Belajar memakai API & State Management."
    },
    {
      "judul": "UI/UX Mobile Apps",
      "guru": "Bu Sinta",
      "tanggal": "19 Nov 2025",
      "status": "Proses",
      "catatanGuru": "Perlu perbaikan layout.",
      "catatanSiswa": "Belajar responsive design."
    },
    {
      "judul": "Game Development Dasar",
      "guru": "Pak Yoga",
      "tanggal": "10 Nov 2025",
      "status": "Pending",
      "catatanGuru": "-",
      "catatanSiswa": "Masih memahami engine."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(name: 'Abdul Hadi', kelas: 'PPLG XII-4'),
      drawer: const AppDrawer(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Title =====
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Progress Belajar',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Pantau perkembangan kompetensi dan materi pembelajaran Anda',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Monday, 24 November 2025',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // ===== Stats Cards =====
              _buildStatCard('Total Pengajuan', '3', 'Semua status', Colors.blue, Icons.check_circle_outline),
              const SizedBox(height: 16),
              _buildStatCard('Halaman Ini', '3', 'Data ditampilkan', Colors.green, Icons.description_outlined),
              const SizedBox(height: 16),
              _buildStatCard('Status Pending', '1', 'Perlu validasi', Colors.orange, Icons.access_time),
              const SizedBox(height: 16),
              _buildStatCard('Total Halaman', '1', 'Navigasi tersedia', Colors.purple, Icons.insert_emoticon_outlined),

              const SizedBox(height: 32),

              // ===== Project List =====
              _buildProjectCard('Project Work', 'Kompetensi dan materi pembelajaran'),
              const SizedBox(height: 16),
              _buildProjectCard('Mobile Apps', 'Kompetensi dan materi pembelajaran'),
              const SizedBox(height: 16),
              _buildProjectCard('UKK (Uji Kompetensi Keahlian)', 'Kompetensi dan materi pembelajaran'),
              const SizedBox(height: 16),
              _buildProjectCard('GIM', 'Kompetensi dan materi pembelajaran'),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ===================== STAT CARD =====================
  Widget _buildStatCard(
    String title,
    String value,
    String status,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text(
                      status,
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Icon(icon, size: 32, color: color),
        ],
      ),
    );
  }

  // ===================== PROJECT CARD =====================
  Widget _buildProjectCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 244, 244),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 16),

          // ===== ExpansionTile List Komp =====
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dummyKompetensi.length,
            itemBuilder: (context, index) {
              final item = dummyKompetensi[index];

              return ExpansionTile(
                title: Text(
                  item["judul"],
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                subtitle: Text(
                  "Status: ${item["status"]}",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                children: [
                  // Card Detail
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _detailRow("Guru", item["guru"]),
                            _detailRow("Tanggal", item["tanggal"]),
                            _detailRow("Status", item["status"]),
                            _detailRow("Catatan Guru", item["catatanGuru"]),
                            _detailRow("Catatan Siswa", item["catatanSiswa"]),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 110, child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
