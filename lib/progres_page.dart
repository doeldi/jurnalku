import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/appbar.dart';
import 'package:jurnalku/widgets/appdrawer.dart';

class ProgressBelajarPage extends StatelessWidget {
  const ProgressBelajarPage({Key? key}) : super(key: key);

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
              // Title Section
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

              // Stats Cards
              _buildStatCard(
                'Total Pengajuan',
                '0',
                'Semua status',
                Colors.blue,
                Icons.check_circle_outline,
              ),
              const SizedBox(height: 16),
              _buildStatCard(
                'Halaman Ini',
                '0',
                'Data ditampilkan',
                Colors.green,
                Icons.description_outlined,
              ),
              const SizedBox(height: 16),
              _buildStatCard(
                'Status Pending',
                '0',
                'Perlu validasi',
                Colors.orange,
                Icons.access_time,
              ),
              const SizedBox(height: 16),
              _buildStatCard(
                'Total Halaman',
                '1',
                'Navigasi tersedia',
                Colors.purple,
                Icons.insert_emoticon_outlined,
              ),
              const SizedBox(height: 32),

              // Project List
              _buildProjectCard(
                'Project Work',
                'Kompetensi dan materi pembelajaran',
              ),
              const SizedBox(height: 16),
              _buildProjectCard(
                'Mobile Apps',
                'Kompetensi dan materi pembelajaran',
              ),
              const SizedBox(height: 16),
              _buildProjectCard(
                'UKK (Uji Kompetensi Keahlian)',
                'Kompetensi dan materi pembelajaran',
              ),
              const SizedBox(height: 16),
              _buildProjectCard('GIM', 'Kompetensi dan materi pembelajaran'),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

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
        border: Border.all(color: Colors.grey.shade300, width: 1),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 11,
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(icon, size: 32, color: color.withOpacity(0.7)),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 244, 244),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 20,
              columns: const [
                DataColumn(
                  label: Text(
                    'KOMPETENSI',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'GURU',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'TANGGAL',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'STATUS',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'CATATAN GURU',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'CATATAN SISWA',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
              rows: const [],
            ),
          ),
        ],
      ),
    );
  }
}
