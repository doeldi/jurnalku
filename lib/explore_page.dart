import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jurnalku/dashboard_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String? selectedRombel;
  String? selectedRayon;
  String? selectedJurusan;
  bool showFilter = false;

  int currentPage = 1;
  final int itemsPerPage = 5;

  // Contoh data siswa
  final List<Map<String, String>> siswaList = List.generate(20, (index) {
    return {
      "nama": "Siswa ${index + 1}",
      "rombel": "PPLG-${(index % 3) + 1}",
      "rayon": "Cisarua-${(index % 2) + 1}",
      "nis": "12345${index + 10}",
      "jurusan": "PPLG",
    };
  });

  // Widget reusable dropdown
  Widget buildDropdown(String label, String hint, String? value,
      List<String> items, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  // Widget reusable button
  Widget buildButton(String text, VoidCallback onPressed,
      {bool isPrimary = true}) {
    return SizedBox(
      width: double.infinity,
      child: isPrimary
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A8A),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(text,
                  style: const TextStyle(fontSize: 16, color: Colors.white)),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(text, style: const TextStyle(fontSize: 16)),
            ),
    );
  }

  // Fungsi pagination
  List<Map<String, String>> get paginatedSiswa {
    final start = (currentPage - 1) * itemsPerPage;
    final end = (start + itemsPerPage);
    return siswaList.sublist(
        start, end > siswaList.length ? siswaList.length : end);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Icon(Icons.book, color: Color(0xFF1E3A8A)),
            SizedBox(width: 8),
            Text(
              'Jurnalku',
              style: TextStyle(
                  color: Color(0xFF1E3A8A), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: ElevatedButton.icon(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DashboardPage())),
              icon: const Icon(Icons.dashboard, color: Colors.white),
              label: const Text(
                'Dashboard',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A8A),
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack berisi banner dan form
            Stack(
              children: [
                Positioned.fill(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Banner-Web.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'Direktori Siswa',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Temukan dan jelajahi profil siswa SMK Wikrama Bogor',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            'Cari nama siswa, NIS, atau rombel...',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        prefixIcon: const Icon(Icons.search),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  SizedBox(
                                    height: 55,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF1E3A8A),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 16),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: const Text('Cari',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              OutlinedButton.icon(
                                onPressed: () =>
                                    setState(() => showFilter = !showFilter),
                                icon: Icon(showFilter
                                    ? Icons.keyboard_arrow_up
                                    : Icons.filter_list),
                                label: const Text('Filter Lanjutan'),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 48),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              if (showFilter) ...[
                                const SizedBox(height: 16),
                                buildDropdown(
                                  'Rombel',
                                  'Semua Rombel',
                                  selectedRombel,
                                  ['Rombel 1', 'Rombel 2', 'Rombel 3'],
                                  (val) => setState(() => selectedRombel = val),
                                ),
                                const SizedBox(height: 16),
                                buildDropdown(
                                  'Rayon',
                                  'Semua Rayon',
                                  selectedRayon,
                                  ['Rayon 1', 'Rayon 2', 'Rayon 3'],
                                  (val) => setState(() => selectedRayon = val),
                                ),
                                const SizedBox(height: 16),
                                buildDropdown(
                                  'Jurusan',
                                  'Semua Jurusan',
                                  selectedJurusan,
                                  ['PPLG', 'TKJ', 'RPL'],
                                  (val) =>
                                      setState(() => selectedJurusan = val),
                                ),
                                const SizedBox(height: 20),
                                buildButton('Terapkan Filter', () {
                                  setState(() => showFilter = false);
                                }),
                                const SizedBox(height: 12),
                                buildButton(
                                  'Reset Filter',
                                  () => setState(() {
                                    selectedRombel = null;
                                    selectedRayon = null;
                                    selectedJurusan = null;
                                  }),
                                  isPrimary: false,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // === LIST DATA SISWA (Looping) ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: paginatedSiswa.map((siswa) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Header section with profile
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // Profile picture
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/default-profile.jpg'),
                                radius: 30,
                              ),
                              const SizedBox(width: 12),
                              // Name and details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      siswa['nama']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${siswa['nis']} | ${siswa['rombel']} | ${siswa['rayon']}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Stats section
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                  color: Colors.grey[200]!, width: 1),
                              bottom: BorderSide(
                                  color: Colors.grey[200]!, width: 1),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.folder_outlined,
                                      size: 18, color: Colors.grey[600]),
                                  const SizedBox(width: 6),
                                  Text(
                                    '3 Portfolio',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.card_membership_outlined,
                                      size: 18, color: Colors.grey[600]),
                                  const SizedBox(width: 6),
                                  Text(
                                    '6 Sertifikat',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Button section
                        InkWell(
                          onTap: () {
                            // Aksi ketika diklik
                          },
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: const BoxDecoration(
                              color: Color(0xFF0D47A1), // Dark blue color
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Lihat Detail',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // === PAGINATION ===
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: currentPage > 1
                      ? () => setState(() => currentPage--)
                      : null,
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                Text(
                  'Halaman $currentPage dari ${(siswaList.length / itemsPerPage).ceil()}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed:
                      currentPage < (siswaList.length / itemsPerPage).ceil()
                          ? () => setState(() => currentPage++)
                          : null,
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // === FOOTER ===
            Container(
              color: const Color(0xFF0D47A1),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.phone, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 16),
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
