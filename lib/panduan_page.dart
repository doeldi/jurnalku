import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/appbar.dart';
import 'package:jurnalku/widgets/appdrawer.dart';

class PanduanPage extends StatelessWidget {
  const PanduanPage({super.key});

  Widget _buildSection(String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
              letterSpacing: -0.5,
            ),
          ),
        ),
        ...items.map(
          (item) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D47A1).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  item['icon'],
                  color: const Color(0xFF0D47A1),
                  size: 24,
                ),
              ),
              title: Text(
                item['title'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  item['subtitle'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final umumItems = [
      {
        'icon': Icons.person_outline,
        'title': 'Unggah Profile',
        'subtitle': 'Panduan untuk mengunggah profile pengguna'
      },
      {
        'icon': Icons.lock_outline,
        'title': 'Ganti Password',
        'subtitle': 'Panduan untuk mengganti password pengguna'
      },
    ];

    final siswaItems = [
      {
        'icon': Icons.book_outlined,
        'title': 'Mengisi Jurnal',
        'subtitle': 'Panduan untuk mengisi kegiatan sehari-hari'
      },
      {
        'icon': Icons.assignment_ind_outlined,
        'title': 'Kelengkapan Profile',
        'subtitle': 'Panduan untuk melengkapi profile'
      },
      {
        'icon': Icons.folder_outlined,
        'title': 'Mengelola Portfolio',
        'subtitle': 'Panduan untuk menambah, edit, dan hapus portfolio'
      },
      {
        'icon': Icons.verified_outlined,
        'title': 'Mengelola Sertifikat',
        'subtitle': 'Panduan untuk menambah, edit, dan hapus sertifikat'
      },
      {
        'icon': Icons.note_alt_outlined,
        'title': 'Catatan Sikap Saya',
        'subtitle': 'Panduan untuk melihat dan memahami catatan sikap'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      drawer: const AppDrawer(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 950,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Panduan Penggunaan",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Selamat datang di panduan penggunaan aplikasi Jurnalku. "
                      "Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur "
                      "yang tersedia dengan optimal.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildSection("Umum", umumItems),
                _buildSection("Untuk Siswa", siswaItems),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
